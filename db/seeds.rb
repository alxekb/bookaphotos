# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# if Rails.env.development?

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

User.create!(email: 'user1@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'user2@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'user3@example.com', password: 'password', password_confirmation: 'password')

City.create(title: 'Москва')
City.create(title: 'Минск')
City.create(title: 'Париж')
City.create(title: 'Берлин')
City.create(title: 'Лондон')

Theme.create(title: 'Озеро')
Theme.create(title: 'Природа')
Theme.create(title: 'Лес')
Theme.create(title: 'Цветы')
Theme.create(title: 'Горы')

99.times do |t|
  PhotoSession.create(
    user: User.all.sample,
    title: 2.times.map{|x| (0...12).map{ (65 + rand(26)).chr }.join.downcase.capitalize }.join(" "),
    description: 16.times.map{|x| (0...12).map{ (65 + rand(26)).chr }.join.downcase.capitalize }.join(" "),
    price: Random.rand(100)*10.00/Random.rand(11),
    published: true,
    cities: City.all.sample(1),
    themes: Theme.all.sample(2)
  )
end

# end
