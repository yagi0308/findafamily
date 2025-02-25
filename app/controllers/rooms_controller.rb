class RoomsController < ApplicationController
  before_action :set_post, only: [:show, :create]
  before_action :set_or_create_room, only: :show

  def create
    redirect_to post_room_path(@post, @room)
  end

  def show
    @rooms = Room.where(post_id: @post.id)
    @chat_users = @room.users.where.not(id: @post.user_id) # 投稿者以外のユーザー一覧
    @messages = @room.messages.includes(:user)
    @message = @room.messages.build
  end

  private

  def set_post
    @post = Post.find_by(id: params[:post_id])
    redirect_to root_path, alert: '投稿が見つかりません' unless @post
  end

  def set_or_create_room
    @room = Room.find_or_create_by(post_id: @post.id, user_id: current_user.id)
    puts "Room Created/Found: #{@room.id}"

    # Entry（ログインユーザー）
    entry1 = Entry.find_by(user_id: current_user.id, room_id: @room.id)
    unless entry1
      entry1 = Entry.create!(user_id: current_user.id, room_id: @room.id)
      puts "Entry 1 Created: User #{current_user.id}, Room #{@room.id}"
    end

    # Entry（投稿者）
    entry2 = Entry.find_by(user_id: @post.user_id, room_id: @room.id)
    return if entry2

    entry2 = Entry.create!(user_id: @post.user_id, room_id: @room.id)
    puts "Entry 2 Created: User #{@post.user_id}, Room #{@room.id}"
  end
end
