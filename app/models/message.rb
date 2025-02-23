class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one_attached :message_image

  validates :message, presence: true, length: { maximum: 140 }, unless: :message_image_attached?

  private

  def message_image_attached?
    message_image.attached?
  end
end
