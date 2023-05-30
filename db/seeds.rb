# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require 'faker'
Product.destroy_all
User.destroy_all

user = User.new(first_name: "test", last_name: "test", email: "exemple@exemple.com", password: "testingtest1")
user.save
p user

20.times do
  attrs = {
    title: Faker::Movies::HitchhikersGuideToTheGalaxy.planet,
    price: (50..1000).to_a.sample,
    description: Faker::TvShows::DrWho.quote,
    category: ["weapon", "enchentment", "potion", "equipement"].sample,
    user_id: user.id
  }
  puts attrs
  product = Product.new(attrs)
  save = product.save
  p product
  puts save
end
