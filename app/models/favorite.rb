class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :favoritable, polymorphic: true # post, item どちらもこれで扱う

  validates :favoritable_type, :favoritable_id, presence: true

  self.table_name = 'favorites' # 明示的にテーブル名を指定

  def self.ransackable_attributes(auth_object = nil)
    %w[user_id favoritable_type favoritable_id]
  end
end
