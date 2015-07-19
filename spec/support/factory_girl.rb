require 'factory_girl'

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(10, 20) }
    profile_photo { Faker::Avatar.image }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    username { Faker::Internet.user_name }

    factory :admin do
      admin true
    end
  end

  factory :state do
    name { Faker::Address.city }
    description { Faker::Lorem.sentence }
  end

  factory :city do
    name { Faker::Address.city }
    description { Faker::Lorem.sentence }
    state_id { 1 }
  end

  factory :neighborhood do
    name { Faker::Address.city }
    description { Faker::Lorem.sentence }
    city_id { 1 }
  end

  factory :event do
    name { Faker::Address.city }
    description { Faker::Lorem.sentence }
    address { Faker::Address.street_address }
    zip_code { Faker::Address.zip_code }
    phone { Faker::Number.number(10) }
    photo_url { Faker::Avatar.image }
  end
end
