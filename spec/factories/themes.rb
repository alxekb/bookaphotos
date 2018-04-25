FactoryBot.define do
  factory :theme do
    title { Faker::GameOfThrones.quote }
  end
end
