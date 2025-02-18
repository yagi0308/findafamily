class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true
  belongs_to :item, optional: true
end
