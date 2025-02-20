class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true
  belongs_to :item, optional: true
  belongs_to :favoritable, polymorphic: true

  validates :favoritable_type, :favoritable_id, presence: true

  self.table_name = 'favorites' # 明示的にテーブル名を指定

  def self.ransackable_attributes(auth_object = nil)
    %w[post_id user_id item_id]
  end
end
