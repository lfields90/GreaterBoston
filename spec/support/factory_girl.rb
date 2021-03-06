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
    state
  end

  factory :neighborhood do
    name { Faker::Address.city }
    description { Faker::Lorem.sentence }
  end

  factory :event do
    name { Faker::Address.city }
    description { Faker::Lorem.sentence }
    date { Faker::Date.forward(60) }
    address { Faker::Address.street_address }
    photo_url { Faker::Avatar.image }
  end

  factory :category do
    name { Faker::Company.suffix }
  end
end
