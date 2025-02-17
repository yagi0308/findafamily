class FavoritesController < ApplicationController
  def create
    if params[:post_id]
      favorite = current_user.favorites.build(post_id: params[:post_id])
      path = post_path(params[:post_id])
    elsif params[:item_id]
      favorite = current_user.favorites.build(item_id: params[:item_id])
      path = item_path(params[:item_id])
    end

    if favorite.save
      logger.debug 'Favorite successfully saved'
      redirect_to path, notice: 'お気に入りに追加しました。'
    else
      logger.debug 'Failed to save favorite: ' + favorite.errors.full_messages.join(', ')
      redirect_to path, alert: 'お気に入り追加に失敗しました。'
    end
  end

  def destroy
    if params[:post_id]
      favorite = Favorite.find_by(post_id: params[:post_id], user_id: current_user.id)
      path = post_path(params[:post_id])
    elsif params[:item_id]
      favorite = Favorite.find_by(item_id: params[:item_id], user_id: current_user.id)
      path = item_path(params[:item_id])
    end

    if favorite&.destroy
      logger.debug 'Favorite successfully destroyed'
      redirect_to path, notice: 'お気に入りを解除しました。'
    else
      logger.debug 'Failed to destroy favorite: ' + favorite.errors.full_messages.join(', ')
      redirect_to path, alert: 'お気に入り解除に失敗しました。'
    end
  end
end
