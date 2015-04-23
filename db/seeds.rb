# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "\n Creating restaurants..."
20.times do
  Restaurant.create!(
    name: Faker::Company.name + [" Fried Chicken", " Soups"].sample,
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    description: Faker::Hacker.say_something_smart
  )
  print "|".green
end

puts "\n Creating users..."
50.times do
  u = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "1234",
    password_confirmation: "1234",
    phone: Faker::PhoneNumber.cell_phone
  )
  print "|".blue.bold

  # puts "\n Creating reservations..."
  rand(1..8).times do
    Reservation.create!(
      party_size: rand(2..10),
      date: DateTime.now + rand(4..10).days,
      user_id: u.id,
      restaurant_id: Restaurant.all.sample.id
    )
    print "|".green
  end
end

puts ""