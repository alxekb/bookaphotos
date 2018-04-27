FactoryBot.define do
  factory :city do
    sequence(:title) { |n| "#{Faker::GameOfThrones.quote}-#{n}" }
  end
end
