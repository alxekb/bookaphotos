FactoryBot.define do
  factory :session_day do
    photo_session
    currency
    start_time { Faker::Time.forward(2, :morning) }
    special { Faker::Boolean.boolean(0.5) }
    price { Faker::Number.between(1, 5000) }
  end
end