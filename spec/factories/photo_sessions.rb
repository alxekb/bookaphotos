FactoryBot.define do
  factory :photo_session do
    sequence(:title) { |n| "#{Faker::GameOfThrones.quote}-#{n}" }
    description { Faker::GameOfThrones.quote }
    price { Faker::Number.between(1, 5000) }
    published { Faker::Boolean.boolean(0.5) }
    duration { Faker::Number.between(10, 120) }
    photos_count { Faker::Number.between(10, 600) }
    period_of_execution { Faker::Number.between(10.30) }
    price_per_photo { Faker::Number.between(1, 100) }
    for_whom { Faker::GameOfThrones.character }
    preparation { Faker::GameOfThrones.house }
    what_to_take { Faker::GameOfThrones.dragon }
    how_route { Faker::RickAndMorty.location }
    how_find { Faker::RickAndMorty.quote }
    lat { "#{Faker::Number.decimal(2, 10) }" }
    lng { "#{Faker::Number.decimal(2, 10) }" }
    user
    currency
  end
end
