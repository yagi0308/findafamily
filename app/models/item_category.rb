class ItemCategory < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ご飯' },
    { id: 3, name: 'おやつ' },
    { id: 4, name: 'トイレ用品・ニオイ消し' },
    { id: 5, name: 'おもちゃ' },
    { id: 6, name: 'クレート・ゲージ' },
    { id: 7, name: '季節グッズ' },
    { id: 8, name: '猫専用グッズ' },
    { id: 9, name: '犬専用グッズ' },
    { id: 10, name: 'その他の動物グッズ' },
    { id: 11, name: '防犯グッズ' },
    { id: 12, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
