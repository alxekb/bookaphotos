FactoryBot.define do
  factory :profile do
    user
    first_name { Faker::HarryPotter.character }
    last_name { Faker::HarryPotter.house }
    phone { Faker::PhoneNumber.cell_phone }
    avatar { File.new("#{Rails.root}/spec/fixtures/profile_picture.png") }
  end
end
