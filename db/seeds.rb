# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(name: "John",
                    address: "Rua Jerico, 193, São Paulo",
                    phone_number: "2318477",
                    email: "john2@teste.com",
                    password: "123123"
                  )

images = ["https://res.cloudinary.com/dhehnzh5i/image/upload/v1606418899/Gear-Homebrew-630019103_rhnate.jpg", 
  "https://res.cloudinary.com/dhehnzh5i/image/upload/v1606418899/beer-glass_fdolac.jpg",
"https://res.cloudinary.com/dhehnzh5i/image/upload/v1606418898/beer-wit_n4xo4z.jpg"]


10.times do
  beer = Product.create!(name: Faker::Beer.name,
                  description: "#{Faker::Beer.style}, #{Faker::Beer.hop}, #{Faker::Beer.ibu}, #{Faker::Beer.alcohol}",
                  price: rand(1..20),
                  quantity: rand(1..8),
                  user_id: user.id
                )
  image = URI.open(images.sample)
  beer.photo.attach(io: image, filename: "#{beer.name}.jpg", content_type: "image/png")
end