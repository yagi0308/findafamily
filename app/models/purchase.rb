class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_many :addresses, dependent: :destroy
end
