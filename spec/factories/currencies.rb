FactoryBot.define do
  factory :currency do
    sequence(:title) { |n| "#{Faker::Currency.code}-#{n}" }
  end
end
