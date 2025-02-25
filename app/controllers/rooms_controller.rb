class RoomsController < ApplicationController
  before_action :set_post, only: [:show, :create]
  before_action :set_or_create_room, only: :show

  def create
    redirect_to post_room_path(@post, @room)
  end

  def show
    @rooms = Room.where(post_id: @post.id) # 投稿に紐づく全てのルームを取得

    # メッセージを送信したことのあるユーザー一覧を取得（投稿者を除外）
    @chat_users = User.joins(entries: :room)
                      .joins('INNER JOIN messages ON messages.room_id = rooms.id')
                      .where(rooms: { post_id: @post.id })
                      .where.not(users: { id: @post.user_id })
                      .distinct

    @messages = @room.messages.includes(:user)
    @message = @room.messages.build
  end

  private

  def set_post
    @post = Post.find_by(id: params[:post_id])
    return unless @post.nil?

    redirect_to root_path, alert: '投稿が見つかりません'
  end

  def set_or_create_room
    @room = Room.find_or_create_by(post_id: @post.id, user_id: current_user.id)

    # Entry（ログインユーザー）
    entry1 = Entry.find_by(user_id: current_user.id, room_id: @room.id)
    entry1 ||= Entry.create!(user_id: current_user.id, room_id: @room.id)

    # Entry（投稿者）
    entry2 = Entry.find_by(user_id: @post.user_id, room_id: @room.id)
    entry2 ||= Entry.create!(user_id: @post.user_id, room_id: @room.id)
  end
end
