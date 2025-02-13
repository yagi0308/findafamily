class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @item = Item.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def item_params
    params.require(:item).permit(:item_image, :name, :description, :price, :age, :item_category_id, :shipping_fee_id,
                                 :shipping_days_id).merge(user_id: current_user.id)
  end
end
