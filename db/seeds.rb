# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# if Rails.env.development?

# AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password")
#
# User.create!(email: "user1@example.com", password: "password", password_confirmation: "password")
# User.create!(email: "user2@example.com", password: "password", password_confirmation: "password")
# User.create!(email: "user3@example.com", password: "password", password_confirmation: "password")
#
# City.create(title: "Москва")
# City.create(title: "Минск")
# City.create(title: "Париж")
# City.create(title: "Берлин")
# City.create(title: "Лондон")
#
# Theme.create(title: "Озеро")
# Theme.create(title: "Природа")
# Theme.create(title: "Лес")
# Theme.create(title: "Цветы")
# Theme.create(title: "Горы")
Currency.create(title: "USD")
99.times do |_t|
  PhotoSession.create!(
    user: User.all.sample,
    title: 2.times.map { |_x| (0...12).map { (65 + rand(26)).chr }.join.downcase.capitalize }.join(" "),
    description: 16.times.map { |_x| (0...12).map { (65 + rand(26)).chr }.join.downcase.capitalize }.join(" "),
    published: true,
    currency: Currency.first,
    duration: 10,
    price: 10,
    photos_count: 10,
    period_of_execution: 10,
    for_whom: "Everyone",
    preparation: "No",
    what_to_take: "Anything",
    how_route: "Easy",
    how_find: "Esy",
    lat: rand(1..90) ,
    lng: rand(1..180),
    price_per_photo: 3,
    cities: City.all.sample(1),
    themes: Theme.all.sample(2)
  )
end

# end
