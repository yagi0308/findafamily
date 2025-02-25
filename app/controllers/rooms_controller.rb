class RoomsController < ApplicationController
  before_action :set_post, only: [:show, :create]
  before_action :set_or_create_room, only: :show

  def create
    redirect_to post_room_path(@post, @room)
  end

  def show
    # @room = Room.find(params[:id]) # URLのルームIDを直接取得
    # unless @room.entries.exists?(user_id: current_user.id)
    # redirect_to root_path, alert: 'このチャットにはアクセスできません。'
    # return
    # end

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
    # return unless @post.nil?
    # redirect_to root_path, alert: '投稿が見つかりません'
  end

  def set_or_create_room
    # URLから直接ルームIDを取得
    @room = Room.find_by(id: params[:id], post_id: @post.id)

    # もしルームが存在しない場合は、新しく作成
    if @room
      # ルームがすでに存在する場合、エントリを追加（もし存在しなければ）
      Entry.create!(user_id: current_user.id, room_id: @room.id) unless @room.entries.exists?(user_id: current_user.id)
      Entry.create!(user_id: @post.user_id, room_id: @room.id) unless @room.entries.exists?(user_id: @post.user_id)
    else
      @room = Room.create!(post_id: @post.id)
      # Entry（ログインユーザー）
      Entry.create!(user_id: current_user.id, room_id: @room.id)
      # Entry（投稿者）
      Entry.create!(user_id: @post.user_id, room_id: @room.id)

    end
  end
end
