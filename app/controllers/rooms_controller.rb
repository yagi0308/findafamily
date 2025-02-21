class RoomsController < ApplicationController
  before_action :set_post, only: [:show, :create]

  def create
    # 既存のチャットルームがあれば取得、なければ新規作成
    @room = Room.find_or_create_by(post_id: @post.id, user_id: current_user.id)
    redirect_to post_room_path(@post, @room)
  end

  def show
    @room = Room.find_by(id: params[:id], post_id: @post.id)
    return redirect_to post_path(@post), alert: 'チャットルームが見つかりません' unless @room

    # すべてのルーム情報を取得（投稿者用）
    @rooms = Room.where(post_id: @post.id)
    @room = if current_user == @post.user
              # 投稿者の場合は、どのユーザーの Room でもアクセス可能
              @rooms.find_by(id: params[:id])
            else
              # 通常ユーザーの場合は、自分の Room のみ取得
              @rooms.find_by(id: params[:id], user_id: current_user.id)
            end
    unless @room
      redirect_to post_path(@post), alert: 'チャットルームが見つかりません'
      return
    end

    # 投稿者を除外したチャットユーザー一覧を取得
    @chat_users = User.joins(:rooms).where(rooms: { post_id: @post.id }).where.not(id: @post.user_id).distinct

    # メッセージを取得
    @messages = @room.messages.includes(:user)
    @message = @room.messages.build
  end

  private

  def set_post
    @post = Post.find_by(id: params[:post_id])
    redirect_to root_path, alert: '投稿が見つかりません' unless @post
  end
end
