# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(username: "JohnDoe", password: "123Soleil")
User.create(username: "Rolmips", password: "123Soleil")
User.create(username: "JamesBond", password: "123Soleil")
User.create(username: "RolandM", password: "123Soleil")
User.create(username: "Isa", password: "123Soleil")
Message.create(body: "Message JohnDoe", user_id: 1)
Message.create(body: "Message Rolmips", user_id: 2)
Message.create(body: "Message JamesBond", user_id: 3)
Message.create(body: "Message RolandM", user_id: 4)
Message.create(body: "Message Isa", user_id: 5)
