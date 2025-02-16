FactoryBot.define do
  factory :post do
    animal_image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/sample.jpg'), 'image/jpg') }
    title { 'Sample Title' }
    category_id { 5 }
    animal_type { 'Dog' }
    age { '2' }
    gender_id { 4 }
    personality { 'Friendly' }
    address { 'Friendly' }
    description { 'A friendly dog looking for a new home' }
    association :user
  end
end
