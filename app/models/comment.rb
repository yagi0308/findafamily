class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_one_attached :comment_image

  before_destroy :purge_comment_image
  validates :content, presence: true

  private

  def purge_comment_image
    comment_image.purge if comment_image.attached?
  end
end
