# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.new(name:"Paul", email:"coucou@coucou.com", password:"password")
user2= User.new(name:"victor", email:"victor@coucou.com", password:"password")


hen1 = Hen.new(name: "Popo", price: 2, disponibility: true, user_id: 1)
hen2= Hen.new(name: "Pupu", price: 21, disponibility: true, user_id: 2)
