FactoryBot.define do
  factory :photo_session do
    sequence(:title) { |n| "#{Faker::GameOfThrones.quote}-#{n}" }
    description { Faker::GameOfThrones.quote }
    published { Faker::Boolean.boolean(0.5) }
    duration { Faker::Number.between(10, 120) }
    photos_count { Faker::Number.between(10, 600) }
    period_of_execution { Faker::Number.between(10.30) }
    for_whom { Faker::GameOfThrones.character }
    preparation { Faker::GameOfThrones.house }
    what_to_take { Faker::GameOfThrones.dragon }
    user
    currency
  end
end
