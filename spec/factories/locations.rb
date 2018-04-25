FactoryBot.define do
  factory :location do
    user
    name { Faker::Address.city}
    how_to_find { Faker::Lorem.sentence }
    address { Faker::Address.street_address }
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
  end
end
