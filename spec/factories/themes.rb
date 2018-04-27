FactoryBot.define do
  factory :theme do
    sequence(:title) { |n| "#{Faker::GameOfThrones.quote}-#{n}" }
  end
end
