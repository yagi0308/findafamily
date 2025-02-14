class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :gender
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :animal_image

  def self.ransackable_associations(auth_object = nil)
    %w[animal_image_attachment animal_image_blob category comments gender user]
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

  def self.ransackable_attributes(auth_object = nil)
    %w[animal_image_attachment animal_image_blob category comments gender user]
  end

  def acceptable_image
    unless animal_image.attached?
      errors.add(:animal_image, 'を添付してください')
      return
    end

    errors.add(:animal_image, 'is too big') if animal_image.byte_size > 2.megabytes

    acceptable_types = ['image/jpeg', 'image/png']
    return if acceptable_types.include?(animal_image.content_type)

    errors.add(:animal_image, 'must be a JPEG or PNG')
  end
end
