class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    if params[:post_id]
      favorite = current_user.favorites.build(post_id: params[:post_id])
    elsif params[:item_id]
      favorite = current_user.favorites.build(item_id: params[:item_id])
    end

    if favorite&.save
      redirect_to root_path, notice: 'お気に入りに追加しました。'
    else
      redirect_to root_path, alert: 'お気に入り追加に失敗しました。'
    end
  end

  def destroy
    if params[:post_id]
      favorite = Favorite.find_by(post_id: params[:post_id], user_id: current_user.id)
    elsif params[:item_id]
      favorite = Favorite.find_by(item_id: params[:item_id], user_id: current_user.id)
    end

    if favorite&.destroy
      redirect_to root_path, notice: 'お気に入りを解除しました。'
    else
      redirect_to root_path, alert: 'お気に入り解除に失敗しました。'
    end
  end
end
