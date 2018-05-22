FactoryBot.define do
  factory :option, class: "PhotoSession::Option" do
    photo_session
    additional_option
    price { Faker::Commerce.price }
  end
end
