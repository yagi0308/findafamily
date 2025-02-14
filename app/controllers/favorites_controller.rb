class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.build(post_id: params[:post_id], item_id: params[:item_id])
    favorite.save
    redirect_to root_path
  end

  def destroy
    favorite = Favorite.find_by(post_id: params[:post_id], item_id: params[:item_id], user_id: current_user.id)
    favorite.destroy
    redirect_to root_path
  end
end
