class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :item
end
