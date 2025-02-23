class MessagesController < ApplicationController
  before_action :set_post
  before_action :set_room

  def create
    @message = @room.messages.build(message_params)
    @message.user = current_user

    if @message.save
      redirect_to post_room_path(@post, @room, hide_list: true) # 送信後も同じチャット画面にとどまる
    else
      render :new
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id]) # URLにpost_idが含まれているか確認
  end

  def set_room
    @room = Room.find_by(id: params[:room_id]) # find → find_by に変更して nil の可能性を考慮
    return unless @room.nil?

    redirect_to root_path, alert: 'チャットルームが見つかりません'
  end

  def message_params
    params.require(:message).permit(:message, :message_image)
  end
end
