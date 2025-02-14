class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :gender
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :animal_image

  def self.ransackable_attributes(auth_object = nil)
    %w[title category_id animal_type gender_id address]
  end

  with_options presence: true do
    validates :title, length: { maximum: 99 }
    validates :category_id, numericality: { only_integer: true, greater_than: 1, message: 'を入力してください' }
    validates :animal_type, length: { maximum: 39 }
    validates :gender_id, numericality: { only_integer: true, greater_than: 1, message: 'を入力してください' }
    validates :personality, length: { maximum: 99 }
    validates :description, length: { maximum: 1999 }
    validates :user, presence: true
    validates :address, length: { maximum: 99 }
  end

  validate :acceptable_image

  private

  def acceptable_image
    unless animal_image.attached?
      errors.add(:animal_image, 'を添付してください')
      return
    end

    errors.add(:animal_image, 'は2MB以下でなければなりません') if animal_image.byte_size > 2.megabytes

    acceptable_types = ['image/jpeg', 'image/png']
    return if acceptable_types.include?(animal_image.content_type)

    errors.add(:animal_image, 'はJPEGまたはPNG形式である必要があります')
  end
end
