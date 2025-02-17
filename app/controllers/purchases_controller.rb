class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :redirect_if_seller_or_sold, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.item_price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
      @purchase_address.save
      redirect_to items_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_seller_or_sold
    return unless @item.user_id == current_user.id || @item.purchase.present?

    redirect_to items_path
  end

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :street, :building,
                                             :home_phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end
end
