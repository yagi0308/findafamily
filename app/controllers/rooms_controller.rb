class RoomsController < ApplicationController
  before_action :set_post, only: [:show, :create, :destroy]
  before_action :set_or_create_room, only: [:show, :destroy]

  def create
    redirect_to post_room_path(@post, @room)
  end

  def show
    @room = Room.find(params[:id]) # URLのルームIDを直接取得

    unless @room.entries.exists?(user_id: current_user.id)
      redirect_to root_path, alert: 'このチャットにはアクセスできません。'
      return
    end

    @rooms = Room.where(post_id: @post.id) # 投稿に紐づく全てのルームを取得（必要なら残す）

    # メッセージを送信したことのあるユーザー一覧を取得（投稿者を除外）
    @chat_users = User.joins(entries: :room)
                      .joins('INNER JOIN messages ON messages.room_id = rooms.id')
                      .where(rooms: { post_id: @post.id })
                      .where.not(users: { id: @post.user_id })
                      .distinct

    @messages = @room.messages.includes(:user)
    @message = @room.messages.build
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to root_path, notice: 'チャットルームが削除されました。'
  end

  private

  def set_post
    @post = Post.find_by(id: params[:post_id])
    return unless @post.nil?

    redirect_to root_path, alert: '投稿が見つかりません'
  end

  def set_or_create_room
    # まず既存のルームを取得する
    @room = Room.joins(:entries).where(post_id: @post.id, entries: { user_id: current_user.id }).first

    # もしルームがなければ、新しく作成
    @room ||= Room.create!(post_id: @post.id, user_id: current_user.id)

    # Entry（ログインユーザー）
    Entry.find_or_create_by!(user_id: current_user.id, room_id: @room.id)

    # Entry（投稿者）
    Entry.find_or_create_by!(user_id: @post.user_id, room_id: @room.id)
  end
end
