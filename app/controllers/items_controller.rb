class ItemsController < ApplicationController
  def index
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
    @items = Item.includes(:user).all
  end

  def show
    @item = Item.find(params[:id])
    @user = @item.user
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to items_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update_purchases
    @item = Item.find(params[:id])
    @item.update(purchases: true)
    redirect_to @item, notice: '準備中です'
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  def search
    @q = Item.ransack(params[:q])
    @search_results = @q.result(distinct: true) if params[:q].present?
    @items = Item.all
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
