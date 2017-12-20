# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# Message.destroy_all
# Conversation.destroy_all
# Booking.destroy_all
# Location.destroy_all
User.destroy_all

puts "DESTROY DATABASE!!!"

puts 'Creating 15 fake users'

15.times do
  User.create(
    email: Faker::Internet.email,
    password: "password",
    # nick_name: Faker::Twitter.screen_name,
    # first_name: Faker::Name.first_name,
    # last_name: Faker::Name.last_name,
    # activity: ACTIVITY.sample,
    # birth_date: Faker::Date.birthday(18, 50),
    # rating: (1..5).to_a.sample,
    # instruments: Faker::Music.instrument,
    # city: Faker::Address.city,
    # country_code: Faker::Address.country_code,
    # avatar: Faker::Avatar.image
    )
end
