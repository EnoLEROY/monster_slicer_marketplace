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

# Cloudinary::Uploader.upload('/Users/enoleroy/code/EnoLEROY/monster_slicer_marketplace/app/assets/images/enchantments/book-1.png',folder: "monster_slicer", public_id: 'book-1')

# users ------------------------------------

users = []
user_names = ['Eragon Dragonier', 'Gandalf TheWhite', 'Gerald Rivera', 'Harold DragonSlayer', 'Gimly TheShort', 'Loki Longhorns', 'Triss Marigold', 'Filther Smith', 'Miranda Grasshopper', 'Aloy Metalshard']
i = 1
10.times do
  url = "https://res.cloudinary.com/demv6536i/image/upload/v1685452456/monster_slicer/avatar-icones/avatar-icone-#{i}.jpg"
  p url
  file = URI.open(url)
  name = user_names[i-1].split(' ')
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

# Personnna
url = "https://res.cloudinary.com/demv6536i/image/upload/v1685452456/monster_slicer/avatar-icones/avatar-icone-4.jpg"
p url
file = URI.open(url)
user = User.new(
  first_name: "Aloy",
  last_name: "Riviera",
  email: "personna@exemple.com",
  password: "testingtest1"
)
user.user_avatar.attach(io: file, filename: "avatar-icone-4.jpg", content_type: "image/jpg")
user.save!
p user
personna = user



# Products ----------------------------------
products = []
# # Swords ----------------------------------
files = []
for i in 1..5
  file = URI.open("https://res.cloudinary.com/demv6536i/image/upload/v1685451397/monster_slicer/weapons/sword-#{i}.png")
  files << file
end

attrs = {
  title: "Bread Cutter",
  price: 30,
  description: "This sword is ideal for the novice traveler looking for some mild adventure. You won't find a better weapon with this quality to price ratio on the market. (Serious renters only, if it breaks you'll pay!)",
  category: Product::CATEGORIES[0],
  user_id: personna
}
product = Product.new(attrs)
product.product_image.attach(io: files[0], filename: 'sword-1.png', content_type: "image/png")
product.save
p product
products << product

attrs = {
  title: "Goblin Slasher",
  price: 70,
  description: "This rusty sword has defeated countless enemies. If you are looking for a big sharp piece of metal to tear through all of your enemies, this one is made for you ! It can be used by amateurs as well as professionals, as long as you have some muscles. Just rent it once and it will become your best companion for the rest of your life.",
  category: Product::CATEGORIES[0],
  user_id: users.sample.id
}
product = Product.new(attrs)
product.product_image.attach(io: files[1], filename: 'sword-2.png', content_type: "image/png")
product.save
p product
products << product

attrs = {
  title: "Royal Guard Sword",
  price: 99,
  description: "This age old weapon has been the trusted sword of many an aventurer.\nHand crafted and designed by monster slicer veterans, a more well rounded blade couldn't be imagined.\nBeautiful, Competent, and less than 100 gold. What more would you need to set out on your quests?",
  category: Product::CATEGORIES[0],
  user_id: users.sample.id
}
product = Product.new(attrs)
product.product_image.attach(io: files[2], filename: 'sword-3.png', content_type: "image/png")
product.save
p product
products << product

attrs = {
  title: "Fire Breath",
  price: 200,
  description: "This blazing sword will pierce easily through your enemy's armor. Its blade is always blazing red as it was forged out of the fire of Mount Doom, and it is therefore filled with power, treachery and deceipt. However, with the right master, it can become an extremely deadly weapon. Use wisely and with caution.",
  category: Product::CATEGORIES[0],
  user_id: users.sample.id
}
product = Product.new(attrs)
product.product_image.attach(io: files[3], filename: 'sword-4.png', content_type: "image/png")
product.save
p product
products << product

attrs = {
  title: "Dragon Slicer",
  price: 690,
  description: "This beast of a weapon decimates monsters with an fury matched by no other blade.The power of a single blow has been rumoured to defeat the dragon Maug... from the hobbit.\nFor the cheap price of 690 gold you too could etch your name into the monster slicer halls of fame.\nP.S. yes this is basically an NFT",
  category: Product::CATEGORIES[0],
  user_id: users.sample.id
}
product = Product.new(attrs)
product.product_image.attach(io: files[4], filename: 'sword-5.png', content_type: "image/png")
product.save
p product
products << product

# Enchantements -----------------------------------


attrs = {
  title: 'Ignitio',
  price: 30,
  description: "This spell is fire.",
  category: Product::CATEGORIES[2],
  user_id: users.sample.id
}
product = Product.new(attrs)
file_name = 'scroll-1.png'
file = URI.open("https://res.cloudinary.com/demv6536i/image/upload/v1685451397/monster_slicer/#{file_name}")

product.product_image.attach(io: file, filename: file_name, content_type: "image/png")
product.save
p product
products << product


attrs = {
  title: 'Anarchist Cook Book',
  price: 57,
  description: "This book is the bomb. Dynamite fishing is cool why not try this against dragons!",
  category: Product::CATEGORIES[2],
  user_id: users.sample.id
}
product = Product.new(attrs)
file_name = 'book-1.png'
file = URI.open("https://res.cloudinary.com/demv6536i/image/upload/v1685451397/monster_slicer/#{file_name}")

product.product_image.attach(io: file, filename: file_name, content_type: "image/png")
product.save
p product
products << product



attrs = {
  title: 'Book of the Dead',
  price: 999,
  description: "Do you ever miss your granny? With this book you'll see her again... but be carful of what you wish for.",
  category: Product::CATEGORIES[2],
  user_id: users.sample.id
}
product = Product.new(attrs)
file_name = 'book-2.png'
file = URI.open("https://res.cloudinary.com/demv6536i/image/upload/v1685451397/monster_slicer/#{file_name}")

product.product_image.attach(io: file, filename: file_name, content_type: "image/png")
product.save
p product
products << product


attrs = {
  title: 'Health Potion',
  price: 10,
  description: "Must have for the wise adventurer.",
  category: Product::CATEGORIES[3],
  user_id: users.sample.id
}
product = Product.new(attrs)
file_name = 'potion-1.png'
file = URI.open("https://res.cloudinary.com/demv6536i/image/upload/v1685451397/monster_slicer/#{file_name}")

product.product_image.attach(io: file, filename: file_name, content_type: "image/png")
product.save
p product
products << product


attrs = {
  title: 'Leather Gloves',
  price: 49,
  description: "Perfect to keep your hands cool while fighting a dragon.",
  category: Product::CATEGORIES[1],
  user_id: users.sample.id
}
product = Product.new(attrs)
file_name = 'glove-1.png'
file = URI.open("https://res.cloudinary.com/demv6536i/image/upload/v1685451397/monster_slicer/#{file_name}")

product.product_image.attach(io: file, filename: file_name, content_type: "image/png")
product.save
p product
products << product

attrs = {
  title: 'Mitril Helm',
  price: 1999,
  description: "The perfect helm to fight the most dangerous creatures... or if you just want to show of your wealth.",
  category: Product::CATEGORIES[1],
  user_id: users.sample.id
}
product = Product.new(attrs)
file_name = 'helmet-1.png'
file = URI.open("https://res.cloudinary.com/demv6536i/image/upload/v1685451397/monster_slicer/#{file_name}")

product.product_image.attach(io: file, filename: file_name, content_type: "image/png")
product.save
p product
products << product


attrs = {
  title: 'Wolf Head',
  price: 99,
  description: "Perfect if you want to show your enemies what you're made of while looking totaly bad-ass!",
  category: Product::CATEGORIES[1],
  user_id: users.sample.id
}
product = Product.new(attrs)
file_name = 'helmet-2.png'
file = URI.open("https://res.cloudinary.com/demv6536i/image/upload/v1685451397/monster_slicer/#{file_name}")

product.product_image.attach(io: file, filename: file_name, content_type: "image/png")
product.save
p product
products << product


attrs = {
  title: 'Heavy Plate Armor',
  price: 150,
  description: "With this on nothig will harm you.",
  category: Product::CATEGORIES[1],
  user_id: users.sample.id
}
product = Product.new(attrs)
file_name = 'armor-1.png'
file = URI.open("https://res.cloudinary.com/demv6536i/image/upload/v1685451397/monster_slicer/#{file_name}")

product.product_image.attach(io: file, filename: file_name, content_type: "image/png")
product.save
p product
products << product


attrs = {
  title: 'Metal Breast Plate',
  price: 250,
  description: "Metal Breast Plate Armor. \nSerius warriors only.",
  category: Product::CATEGORIES[1],
  user_id: users.sample.id
}
product = Product.new(attrs)
file_name = 'armor-2.png'
file = URI.open("https://res.cloudinary.com/demv6536i/image/upload/v1685451397/monster_slicer/#{file_name}")

product.product_image.attach(io: file, filename: file_name, content_type: "image/png")
product.save
p product
products << product




# Rentings ----------------------------------

rentings = []

20.times do
  start = DateTime.now - (10..100).to_a.sample.days
  fin = start + (1..3).to_a.sample.days
  attrs = {
    start_date: start,
    end_date: fin,
    product_id: products.sample.id,
    user_id: users.sample.id
  }

  renting = Renting.new(attrs)
  renting.save
  p renting
  rentings << renting
end
