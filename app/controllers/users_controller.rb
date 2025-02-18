class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @favorite_posts = @user.favorites.where.not(post_id: nil).includes(:post)
    @favorite_items = @user.favorites.where.not(item_id: nil).includes(:item)
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

  def favorites
    @favorite_posts = current_user.favorite_posts
    @favorite_items = current_user.favorite_items
  end

  private

  def set_post
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
end
