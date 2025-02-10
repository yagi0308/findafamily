class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '迷子(保護)' },
    { id: 3, name: '譲渡(里親探し)' },
    { id: 4, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :posts
end
