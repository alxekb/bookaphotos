FactoryBot.define do
  factory :city do
    title { Faker::GameOfThrones.quote }
  end
end
