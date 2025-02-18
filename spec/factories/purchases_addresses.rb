FactoryBot.define do
  factory :purchases_address do
    postal_code { '123-4567' }
    prefecture_id { 48 }
    city { '横浜市緑区' }
    street { '青山1-1-1' }
    building { '柳ビル103' }
    home_phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
