class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  private

  def set_post
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
end
