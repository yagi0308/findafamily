class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '迷子' },
    { id: 3, name: '保護' },
    { id: 4, name: '譲渡' },
    { id: 5, name: '一時預かり' }
  ]

  include ActiveHash::Associations
  has_many :posts

  def self.ransackable_attributes(auth_object = nil)
    %w[id name]
  end
end
