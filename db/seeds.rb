# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require 'faker'
require 'open-uri'
require 'date'


Renting.destroy_all
Product.destroy_all
User.destroy_all

# Cloudinary::Uploader.upload('/Users/enoleroy/code/EnoLEROY/monster_slicer_marketplace/app/assets/images/weapons/swords/sword-2.png',folder: "monster_slicer/weapons", public_id: 'sword-2')

# users ------------------------------------

users = []
i = 1
10.times do
  url = "https://res.cloudinary.com/demv6536i/image/upload/v1685452456/monster_slicer/avatar-icones/avatar-icone-#{i}.jpg"
  p url
  file = URI.open(url)
  name = (Faker::Games::Witcher.character).split(' ')
  user = User.new(
    first_name: name.first,
    last_name: name.last,
    email: "exemple#{i}@exemple.com",
    password: "testingtest1"
  )
  user.user_avatar.attach(io: file, filename: "avatar-icone-#{i}.jpg", content_type: "image/jpg")
  user.save!
  p user
  users << user
  i += 1
end


# Products ----------------------------------
products = []
# # Swords ----------------------------------
files = []
for i in 1..5
  file = URI.open("https://res.cloudinary.com/demv6536i/image/upload/v1685451397/monster_slicer/weapons/sword-#{i}.png")
  files << file
end

attrs = {
  title: Faker::Games::Witcher.sign,
  price: 30,
  description: "This sword is ideal for the novice traveler looking for some mild adventure. You won't find a better weapon with this quality to price ratio on the market. (Serious renters only, if it breaks you'll pay!)",
  category: "Weapon",
  user_id: users.sample.id
}
product = Product.new(attrs)
product.product_image.attach(io: files[0], filename: 'sword-1.png', content_type: "image/png")
product.save
p product
products << product

attrs = {
  title: Faker::Games::Witcher.sign,
  price: 70,
  description: "This rusty sword has defeated countless enemies. If you are looking for a big sharp piece of metal to tear through all of your enemies, this one is made for you ! It can be used by amateurs as well as professionals, as long as you have some muscles. Just rent it once and it will become your best companion for the rest of your life.",
  category: "Weapon",
  user_id: users.sample.id
}
product = Product.new(attrs)
product.product_image.attach(io: files[1], filename: 'sword-2.png', content_type: "image/png")
product.save
p product
products << product

attrs = {
  title: Faker::Games::Witcher.sign,
  price: 99,
  description: "This age old weapon has been the trusted sword of many an aventurer.\nHand crafted and designed by monster slicer veterans, a more well rounded blade couldn't be imagined.\nBeautiful, Competent, and less than 100 gold. What more would you need to set out on your quests?",
  category: "Weapon",
  user_id: users.sample.id
}
product = Product.new(attrs)
product.product_image.attach(io: files[2], filename: 'sword-3.png', content_type: "image/png")
product.save
p product
products << product

attrs = {
  title: Faker::Games::Witcher.sign,
  price: 200,
  description: "This blazing sword will pierce easily through your enemy's armor. Its blade is always blazing red as it was forged out of the fire of Mount Doom, and it is therefore filled with power, treachery and deceipt. However, with the right master, it can become an extremely deadly weapon. Use wisely and with caution.",
  category: "Weapon",
  user_id: users.sample.id
}
product = Product.new(attrs)
product.product_image.attach(io: files[3], filename: 'sword-4.png', content_type: "image/png")
product.save
p product
products << product

attrs = {
  title: Faker::Games::Witcher.sign,
  price: 690,
  description: "This beast of a weapon decimates monsters with an fury matched by no other blade.The power of a single blow has been rumoured to defeat the dragon Maug... from the hobbit.\nFor the cheap price of 690 gold you too could etch your name into the monster slicer halls of fame.\nP.S. yes this is basically an NFT",
  category: "Weapon",
  user_id: users.sample.id
}
product = Product.new(attrs)
product.product_image.attach(io: files[4], filename: 'sword-5.png', content_type: "image/png")
product.save
p product
products << product


# Rentings ----------------------------------

rentings = []

10.times do
  start = DateTime.now - (10..100).to_a.sample.days
  fin = start + (1..3).to_a.sample.days
  attrs = {
    start_date: start,
    end_date: fin,
    product_id: products.sample.id,
    user_id: users.first.id
  }

  renting = Renting.new(attrs)
  renting.save
  p renting
  rentings << renting
end
