# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

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
  # user = User.new(
  #   name: full_name,
  # )
  # user.save!
  puts 'User added.'
end
puts 'All 20 users added.'
