class Post < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :category_id
    validates :animal_type
    validates :gender_id
    validates :personality
    validates :description
    validates :user
  end

  has_one_attached :animal_image
  validate :acceptable_image

  belongs_to :user

  private

  def acceptable_image
    return unless animal_image.attached?

    errors.add(:animal_image, 'is too big') unless animal_image.byte_size <= 2.megabyte

    acceptable_types = ['image/jpeg', 'image/png']
    return if acceptable_types.include?(animal_image.content_type)

    errors.add(:animal_image, 'must be a JPEG or PNG')
  end
end
