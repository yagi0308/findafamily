class Item < ApplicationRecord
  has_one_attached :item_image
  validate :acceptable_image

  with_options presence: true do
    validates :name, length: { maximum: 99 }
    validates :description, length: { maximum: 99 }
    validates :price
    validates :item_category_id, numericality: { only_integer: true, greater_than: 1, message: 'を入力してください' }
    validates :shipping_fee_id, numericality: { only_integer: true, greater_than: 1, message: 'を入力してください' }
    validates :shipping_days_id, numericality: { only_integer: true, greater_than: 1, message: 'を入力してください' }
    validates :user, presence: true
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[name item_category_id price shipping_days_id favorites]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[user favorites item_category shipping_fee shipping_days]
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_category
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_days

  belongs_to :user
  has_many :users, through: :favorites
  has_many :purchases
  has_many :favorites, as: :favoritable, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  private

  def acceptable_image
    unless item_image.attached?
      errors.add(:item_image, 'を添付してください')
      return
    end

    errors.add(:item_image, 'は2MB以下でなければなりません') unless item_image.byte_size <= 2.megabyte

    acceptable_types = ['image/jpeg', 'image/png']
    return if acceptable_types.include?(item_image.content_type)

    errors.add(:item_image, 'はJPEGまたはPNG形式である必要があります')
  end
end
