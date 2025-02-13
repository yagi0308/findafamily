FactoryBot.define do
  factory :item do
    item_image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/sample.jpg'), 'image/jpg') }
    name { 'テスト商品' }
    item_category_id { 12 }
    description { 'これはテスト用の商品です。' }
    price { '1000' }
    shipping_fee_id { 3 }
    shipping_days_id { 4 }
    association :user
  end
end
