# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Deleting all likes"
Like.delete_all
puts "Finished"

puts "Deleting all places"
Place.delete_all
puts "Finished"

puts "deleting all users"
User.delete_all
puts "Finished"

puts "Creating Santi"
User.create(email: "santi@santi.com", password: "santiago")
puts "Finished"

puts "Creating 10 random users"
10.times do
  User.create(email: Faker::Internet.email, password: "testing")
end
puts "Finished"

puts "Creating 10 random places"
10.times do
  Place.create(address: Faker::Address.city, user: User.all.sample)
end
puts "Finished"

puts "Congrats, you now have #{User.count} users and #{Place.count} places"

