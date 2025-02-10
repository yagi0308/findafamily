FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.unique.name }
    email                 { Faker::Internet.unique.email }
    password              { 'password123' }
    password_confirmation { 'password123' }
    last_name             { '猫田' }
    first_name            { '猫助' }
    last_name_kana        { 'ネコタ' }
    first_name_kana       { 'ネコスケ' }
    birthdate             { Faker::Date.birthday(min_age: 18, max_age: 65) }
    phone_number          { '08095151942' }
    region_id             { 48 }
    profile_image         { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/sample.jpg'), 'image/jpg') }
    introduction          { Faker::Lorem.sentence }
  end
end
