class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def show
    @favorite_posts = @user.favorites.where(favoritable_type: 'Post').includes(:favoritable)
    @favorite_items = @user.favorites.where(favoritable_type: 'Item').includes(:favoritable)
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'ユーザーを作成しました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    @user = User.find(params[:id])
    if @user.update(update_params)
      redirect_to user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'ユーザーアカウントを削除しました。'
  end

  def favorites
    @favorite_posts = current_user.favorite_posts
    @favorite_items = current_user.favorite_items
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_user
    redirect_to root_path unless @user == current_user
  end

  def update_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation,
                                 :last_name, :first_name, :last_name_kana, :first_name_kana,
                                 :birthdate, :phone_number, :region_id, :profile_image, :introduction)
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :current_password,
                                 :last_name, :first_name, :last_name_kana, :first_name_kana,
                                 :birthdate, :phone_number, :region_id, :profile_image, :introduction)
  end
end
