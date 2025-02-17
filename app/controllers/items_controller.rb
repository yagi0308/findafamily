class ItemsController < ApplicationController
  def index
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
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
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(post_params)
      redirect_to @item
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update_purchases
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  def search
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
    render :index
  end

  def favorite
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
