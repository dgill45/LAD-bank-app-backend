# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Customer.create!(first_name: "Donell", last_name: "Gill", email: "dag@gmail.com", password: "12345678")
Customer.create!(first_name: "Lisa", last_name: "Boone", email: "boonies@optonline.net", password: "98765432")