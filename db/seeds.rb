# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Hen.destroy_all
User.destroy_all

full_name ="poulette"
email = "poulette@poulette.com"
address = "poulette"
password = "poulette"
description = "poulette"
user = User.new(
  name: full_name,
  email: email,
  address: address,
  description: description,
  password: password
)
user.save!
"poulette created."

puts 'Creating 20 fake  users...'
20.times do
  full_name = Faker::Name.name
  p full_name
  surname = full_name.split[0].downcase
  last_name = full_name.split[1].downcase
  email = "#{surname}.#{last_name}@loremipsum.com"
  p email
  address = "Le Mans"
  p address
  description = Faker::Lorem.paragraph(sentence_count: 2)
  p description
  password = 'poulette'
  user = User.new(
    name: full_name,
    email: email,
    address: address,
    description: description,
    password: password
  )
  user.save!
  puts 'User added.'
end
puts 'All 20 users added.'

puts 'Creating 5 fake hens per user...'
users_created = User.all
users_created.each do |user|
  5.times do
    surname = Faker::Creature::Cat.name
    p surname
    age_hen = (1..8).to_a.sample
    p age_hen
    price_hen = (8..15).to_a.sample
    p price_hen
    description = Faker::Lorem.paragraph(sentence_count: 2)
    p description
    breed_hen = ['ISA Brown', 'Plymouth Rock', 'Barnevelder', 'Australorp', 'Naked Neck', 'Orpington', 'Silkie', 'New Hampshire Red'].sample
    p breed_hen
    hen = Hen.new(
      breed: breed_hen,
      description: description,
      price: price_hen,
      name: surname,
      age: age_hen
      )
    hen.user_id = user.id
    hen.save!
  puts 'Hen added.'
  end
puts 'All 5 hens added.'
end

