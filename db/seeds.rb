# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Product.create(name: "Console Created Laptop", description: "This is created using plain Rails console", image_url: "console.png")
#Product.create(name: "seed-generated product", description: "I also created this product without using the HTML form!", image_url: "seed.png")
#Order.create(user_id: 1, product_id: 1, total: 10.0)
#Order.create(user_id: 1, product_id: 2, total: 5.0)
#Order.create(user_id: 2, product_id: 4, total: 15.0)
Comment.create(product: Product.first, user: User.first, title:"Awesome product", body: "This is the body of the first comment", rating: 5)
Comment.create(product: Product.first, user: User.first, title:"This is bad", body: "Bad", rating: 1)
Comment.create(product: Product.first, user: User.first, title:"Nice Computer", body: "Nice", rating: 4)
Comment.create(product: Product.first, user: User.first, title:"Not happy", body: "Meh", rating: 2)