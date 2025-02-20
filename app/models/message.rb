class Message < ApplicationRecord
  validates :message, presence: true, length: { maximum: 140 }
  belongs_to :user
  belongs_to :room
  has_one_attached :message_image
end
