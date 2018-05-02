FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }

    factory :client do
      role "client"
    end

    factory :photographer do
      role "photographer"
    end
  end
end
