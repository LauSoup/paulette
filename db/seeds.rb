# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
require 'faker'

# Reduce open-uri lower-limit to create temp-files
OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
OpenURI::Buffer.const_set 'StringMax', 0

# Hen.destroy_all
# User.destroy_all

# Default user

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
p "poulette created."

#CREATION OF OTHER SEED USER

# HIGH QUALITY FACIAL PICTURES API (GENERATED API)

image_json_url = "https://api.generated.photos/api/v1/faces?api_key=#{ENV['RANDOM_FACES_API_KEY']}"

# PERSON_index was created to iterate through an array found in the API
person_index = 0

# CREATION OF 10 USERS
10.times do
  p "Creating user."
  # OPEning and PARSING JSON.
  image_json = open(image_json_url).read
  image_info = JSON.parse(image_json)
  # Retrieving image-url from the json, as well as associated image gender.
  image_url = image_info["faces"][person_index]["urls"][4]["512"]
  image = URI.open(image_url)
  image_gender = image_info["faces"][person_index]["meta"]["gender"][0]

  # Creating data of user with RANDOMUSER API.
  # OPEning and PARSING JSON.
  data_url = "https://randomuser.me/api/?nat=fr&gender=#{image_gender}"
  user_json = open(data_url).read
  user = JSON.parse(user_json)

  # CREATING the user's parameters
  full_name = "#{user["results"][0]["name"]["first"]} #{user["results"][0]["name"]["last"]}"
  email = user["results"][0]["email"]
  address = user["results"][0]["location"]["city"]
  description = "#{full_name} is a #{Faker::Job.title} at #{Faker::Company.name}, a company operating in the #{Faker::Company.industry} industry. #{user["results"][0]["name"]["first"]} is originally from the state of #{user["results"][0]["location"]["state"]}, but most importantly, she absolutely adores her hens."
  password = 'poulette'
  latitude = user["results"][0]["location"]["coordinates"]["latitude"].to_f
  longitude = user["results"][0]["location"]["coordinates"]["longitude"].to_f
  final_user = User.new(
    name: full_name,
    email: email,
    address: address,
    description: description,
    password: password
  )
  p "------------------------------"

  final_user.photo.attach(io: image, filename: 'nes.jpg', content_type: 'image/jpg')
  p final_user.photo.attached?
  p final_user.valid?
  p image_url
  p image.class
  final_user.save!
  puts 'User added.'
  puts 'Creating 5 fake hens per user...'
  p "------------------------------"

  # HENS BEING ADDED
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
    availability_array = [true, false]
    hen = Hen.new(
      breed: breed_hen,
      description: description,
      price: price_hen,
      name: surname,
      age: age_hen,
      disponibility: availability_array.sample
      )
    hen.user_id = final_user.id
    hen.save!
    puts 'Hen added.'
  end
  puts 'All 5 hens added.'
  person_index += 1
end
p "20 users added."


# Hen.destroy_all
# User.destroy_all

# full_name ="poulette"
# email = "poulette@poulette.com"
# address = "poulette"
# password = "poulette"
# description = "poulette"
# user = User.new(
#   name: full_name,
#   email: email,
#   address: address,
#   description: description,
#   password: password
# )
# user.save!
# "poulette created."

# puts 'Creating 20 fake  users...'
# 20.times do
#   full_name = Faker::Name.name
#   p full_name
#   surname = full_name.split[0].downcase
#   last_name = full_name.split[1].downcase
#   email = "#{surname}.#{last_name}@loremipsum.com"
#   p email
#   address = ["Le Mans", "Rouen", "Brest", "Blois", "Caen", "Amiens", "Reims", "Soissons", "Chaumont"].sample
#   p address
#   description = ["I'm an happy owner of hens! Happy owner make happy hens!", "Account Manager during the day, and a real mother-hen the rest of the time", "Come visit us and admire our hens, you'll be delighted", "I'll be very happy to take care of your hen[s] for you!", "Nature lover, I'm raising hens since 3 years"].sample
#   p description
#   password = 'poulette'
#   user = User.new(
#     name: full_name,
#     email: email,
#     address: address,
#     description: description,
#     password: password
#   )
#   user.save!
#   puts 'User added.'
#   puts 'Creating 5 fake hens per user...'
#   5.times do
#     surname = Faker::Creature::Cat.name
#     p surname
#     age_hen = (1..8).to_a.sample
#     p age_hen
#     price_hen = (8..15).to_a.sample
#     p price_hen
#     description = Faker::Lorem.paragraph(sentence_count: 2)
#     p description
#     breed_hen = ['ISA Brown', 'Plymouth Rock', 'Barnevelder', 'Australorp', 'Naked Neck', 'Orpington', 'Silkie', 'New Hampshire Red'].sample
#     p breed_hen
#     availability_array = [true, false]
#     hen = Hen.new(
#       breed: breed_hen,
#       description: description,
#       price: price_hen,
#       name: surname,
#       age: age_hen,
#       disponibility: availability_array.sample
#       )
#     hen.user_id = user.id
#     hen.save!
#   puts 'Hen added.'
#   end
# puts 'All 5 hens added.'
# end
# puts 'All 20 users added.'
