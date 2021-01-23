# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Flat.destroy_all

user1 = User.create(password: "holajoaco", email: "user1@gmail.com")
user2 = User.create(password: "holarocio", email: "user2@gmail.com")
user3 = User.create(password: "holatomy", email: "user3@gmail.com")


Flat.create(name: "Depto1", description: "desc1", price: 50, location: "Buenos Aires", user_id: user1.id)
Flat.create(name: "Depto2", description: "desc2", price: 50, location: "Mendoza", user_id: user2.id)
Flat.create(name: "Depto3", description: "desc3", price: 50, location: "Cordoba", user_id: user3.id)
Flat.create(name: "Depto4", description: "desc4", price: 50, location: "Entre Rios", user_id: user1.id)
Flat.create(name: "Depto5", description: "desc5", price: 50, location: "Buenos Aires", user_id: user2.id)
