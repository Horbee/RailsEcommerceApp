# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.create!(name: "Console Created Laptop", description: "This is created using plain Rails console", image_url: "console.png", price: 35000)
Product.create!(name: "seed-generated product", description: "I also created this product without using the HTML form!", image_url: "seed.png", price: 55000)
Product.create!(name: "Awesome Laptop", description: "This is a legendary laptop, and you can do absolutely every job with it", image_url: "awesome.jpg", price: 150000)
Product.create!(name: "Poor Quality Laptop", description: "This ancient product is only recommended, if you have no money for a better one.", image_url: "https://images.pexels.com/photos/748777/pexels-photo-748777.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260", price: 10000)
Product.create!(name: "Better Laptop", description: "This is ordinary computer, with a little bit of extra power.", image_url: "https://images.pexels.com/photos/160107/pexels-photo-160107.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260", price: 20000)
Product.create!(name: "The Beast Laptop", description: "This machine is made to be a king among the computers.", image_url: "https://images.pexels.com/photos/450035/pexels-photo-450035.jpeg?auto=compress&cs=tinysrgb&h=350", price: 350000)
Product.create!(name: "Atomic Laptop", description: "Lorem ipsum dolor amet brunch quinoa put a bird on it direct trade bicycle rights artisan scenester lumbersexual synth helvetica yr pabst. Jianbing selfies locavore butcher cronut. Roof party franzen celiac, irony raw denim tote bag retro twee banjo sriracha hashtag iPhone kickstarter fashion axe. Woke kale chips kitsch selvage kombucha,", image_url: "https://images.pexels.com/photos/450035/pexels-photo-450035.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", price: 55000)
Comment.create!(product: Product.first, user: User.first, title:"Awesome product", body: "This is the body of the first comment", rating: 5)
Comment.create!(product: Product.first, user: User.first, title:"This is bad", body: "Bad", rating: 1)
Comment.create!(product: Product.first, user: User.first, title:"Nice Computer", body: "Nice", rating: 4)
Comment.create!(product: Product.first, user: User.first, title:"Not happy", body: "Meh", rating: 2)