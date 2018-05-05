FactoryBot.define do
  factory :order do
    client
    photographer
    photo_session
    session_day
    comment { Faker::Lorem.sentence }
    photo_count { 10 }
    i_want_to_get_info true
    i_accept_term true
    i_consent_personal_data true

    trait :consent_data_false do
      i_consent_personal_data false
    end

    trait :terms_false do
      i_accept_term false
    end

    trait :not_get_info do
      i_want_to_get_info false
    end
  end
end
