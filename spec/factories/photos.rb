FactoryBot.define do
  factory :photo do
    photo_session
    photo { File.new("#{Rails.root}/spec/fixtures/profile_picture.png") }
  end
end
