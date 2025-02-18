class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :street, :building, :home_phone_number, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, allow_blank: true }
    validates :prefecture_id, numericality: { only_integer: true, greater_than: 1, message: 'を入力してください' }
    validates :city
    validates :street
    validates :home_phone_number, format: { with: /\A\d{10,11}\z/, allow_blank: true, message: 'は不正な値です' }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    if purchase.persisted?
      Address.create(
        postal_code: postal_code, prefecture_id: prefecture_id, city: city,
        street: street, building: building, home_phone_number: home_phone_number,
        purchase_id: purchase.id
      )
    else
      false
    end
  end
end
