FactoryBot.define do
  factory :additional_option do
    user
    name { Faker::GameOfThrones.quote }
  end
end
