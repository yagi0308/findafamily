class Item < ApplicationRecord
  has_one_attached :item_image
  validate :acceptable_image

  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :item_category_id
    validates :shipping_fee_id
    validates :shipping_days_id
    validates :user
  end

  belongs_to :user

  private

  def acceptable_image
    unless item_image.attached?
      errors.add(:item_image, 'を添付してください')
      return
    end

    errors.add(:item_image, 'is too big') unless item_image.byte_size <= 2.megabyte

    acceptable_types = ['image/jpeg', 'image/png']
    return if acceptable_types.include?(item_image.content_type)

    errors.add(:item_image, 'must be a JPEG or PNG')
  end
end
