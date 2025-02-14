class Gender < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'オス' },
    { id: 3, name: 'メス' },
    { id: 4, name: '不明' }
  ]

  include ActiveHash::Associations
  has_many :posts

  def self.ransackable_attributes(auth_object = nil)
    %w[id name]
  end
end
