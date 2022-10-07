# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
=begin
 10.times do
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
=end

#30.times do
cocktail = Cocktail.new
cocktail_url = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
cocktail_json = URI.open(cocktail_url).read
cocktail_hash = JSON.parse(cocktail_json)["drinks"]
puts cocktail_hash
=begin
  cocktail.name = cocktail_hash["strDrink"]
  cocktail.price = rand(10..30)

  cocktail.description =
  cocktail.place =
  cocktail.availability =
  cocktail.photo =
  cocktail.user =
=end
#end
