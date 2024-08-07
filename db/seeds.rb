# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning seed..."
Restaurant.destroy_all

puts "Seeding..."

5.times do
  Restaurant.create!(
    name: Faker::Address.street_name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: %w(chinese italian japanese french belgian).sample

  )
end

Restaurant.all.each do |restaurant|
  puts "Creating #{restaurant.name}"
end

puts "Random restaurants created!"

puts "Now adding and cleaning random reviews..."
Review.destroy_all

Restaurant.all.each do |restaurant|
  5.times do
    restaurant.reviews.create!(
      rating: rand(1..5),
      content: Faker::Restaurant.review
    )
  end
end
puts "Reviews Created!"
puts "All done!"
