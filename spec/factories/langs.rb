FactoryBot.define do
  factory :lang do
    title { Faker::GameOfThrones.character }
  end
end
