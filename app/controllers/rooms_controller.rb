class RoomsController < ApplicationController
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
    @message = @room.messages.build
    @messages = @room.messages.includes(:user)
  end

  private

  def room_params
    params.require(:room).permit(:user_id, :nickname)
  end
end
