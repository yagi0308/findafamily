class Comment < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :post, dependent: :destroy
  has_one_attached :comment_image

  before_destroy :purge_comment_image

  private

  def purge_comment_image
    comment_image.purge if comment_image.attached?
  end
end
