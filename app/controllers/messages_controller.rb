class MessagesController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @post = @room.post # ✅ Room に紐づく Post オブジェクトを取得

    @message = @room.messages.new(message_params)
    @message.user = current_user

    if @message.save
      redirect_to post_room_path(@post, @room) # ✅ 正しいパスへリダイレクト
    else
      @messages = @room.messages.includes(:user)
      render 'rooms/show'
    end
  end

  private

  def message_params
    params.require(:message).permit(:message, :message_image)
  end
end
