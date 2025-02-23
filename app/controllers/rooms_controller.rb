class RoomsController < ApplicationController
  before_action :set_post, only: [:show, :create]

  def create
    @room = Room.find_or_create_by(post_id: @post.id, user_id: current_user.id)
    redirect_to post_room_path(@post, @room)
  end

  def show
    @room = Room.find_by(id: params[:id], post_id: @post.id)
    return redirect_to post_path(@post), alert: 'チャットルームが見つかりません' unless @room

    @rooms = Room.where(post_id: @post.id)

    @chat_users = User.joins(:rooms).where(rooms: { post_id: @post.id }).where.not(id: @post.user_id).distinct

    @messages = @room.messages.includes(:user)
    @message = @room.messages.build
  end

  private

  def set_post
    @post = Post.find_by(id: params[:post_id])
    redirect_to root_path, alert: '投稿が見つかりません' unless @post
  end
end
