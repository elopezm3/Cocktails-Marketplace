# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Users seed
20.times do
  user = User.new
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.email = Faker::Internet.email
  user.role = ["Seller", "Customer"].sample
  user.password = 'koira123'
  user.password_confirmation = 'koira123'
  avatar_url = "https://joeschmoe.io/api/v1/#{user.first_name}"
  image_name = "#{user.first_name}#{user.last_name}.png"
  image = URI.open(avatar_url)
  user.avatar.attach(io: image, filename: image_name, content_type: "image/png")
  user.save
end

# Cocktails seed
80.times do
  cocktail = Cocktail.new
  cocktail_url = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
  cocktail_json = URI.open(cocktail_url).read
  cocktail_hash = JSON.parse(cocktail_json)["drinks"].first
  description = ""
  cocktail.name = cocktail_hash["strDrink"]
  cocktail.price = rand(10..30)
  15.times do |i|
    if cocktail_hash["strIngredient#{i + 1}"] != nil
      ingredient = cocktail_hash["strIngredient#{i + 1}"]
      description += cocktail_hash["strIngredient#{i + 2}"] == nil ? "#{ingredient} and the special touch from the house..." : "#{ingredient}, "
    end
  end
  cocktail.description = description
  cocktail.place = Faker::Address.street_name
  cocktail.availability = rand(0..5)
  cocktail_photo_url = cocktail_hash["strDrinkThumb"]
  cocktail_photo = URI.open(cocktail_photo_url)
  cocktail_photo_name = "#{cocktail.name}.png"
  cocktail.photo.attach(io: cocktail_photo, filename: cocktail_photo_name, content_type: "image/png")
  sellers = User.where(role: "Seller")
  cocktail.user = sellers.sample
  cocktail.save
end

# Bookings seed
40.times do
  booking = Booking.new
  booking.user = User.all.sample
  booking.cocktail = Cocktail.all.sample
  booking.date = Date.tomorrow + (rand * 21)
  booking.save
end
