FactoryBot.define do
  factory :currency do
    title { Faker::Currency.code }
  end
end
