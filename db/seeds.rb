# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Cleaning Database..."
Restaurant.destroy_all

category_array = ["chinese", "italian", "japanese", "french", "belgian"]

puts "Creating 5 Restaurants..."
5.times do |r|
  name = Faker::Restaurant.name
  category = category_array.sample
  address = Faker::Address.full_address
  content = Faker::Restaurant.review
  rating = rand(0..5)

  restaurant = Restaurant.new(name: name, address: address, category: category)
  restaurant.save
  review = Review.new(content: content, rating: rating)
  review.restaurant = restaurant
  review.save
  puts "#{restaurant.name} is created"
end
