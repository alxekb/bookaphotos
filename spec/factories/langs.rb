FactoryBot.define do
  factory :lang do
    sequence(:title) { |n| "#{Faker::GameOfThrones.quote}-#{n}" }
  end
end
