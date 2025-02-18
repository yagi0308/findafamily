class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true
  belongs_to :item, optional: true

  def self.ransackable_attributes(auth_object = nil)
    %w[post_id user_id item_id]
  end
end
