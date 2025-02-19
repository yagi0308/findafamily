class Message < ApplicationRecord
  validates :message, presence: true, length: { maximum: 140 }
  belongs_to :user
  belongs_to :room
  has_one_attached :message_image
  validate :acceptable_image

  private

  def acceptable_image
    unless message_image.attached?
      errors.add(:message_image, 'を添付してください')
      return
    end

    errors.add(:message_image, 'は2MB以下でなければなりません') if message_image.byte_size > 2.megabytes

    acceptable_types = ['image/jpeg', 'image/png']
    return if acceptable_types.include?(message_image.content_type)

    errors.add(:message_image, 'はJPEGまたはPNG形式である必要があります')
  end
end
