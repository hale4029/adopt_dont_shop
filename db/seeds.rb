# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

shelter_1 = Shelter.create(name: "Save Cats",
                          address: "123 Pine",
                          city: "Denver",
                          state: "Colorado",
                          zip: 80112)

shelter_2 = Shelter.create(name: "Save Dogs",
                          address: "134 Pine",
                          city: "Littleton",
                          state: "Colorado",
                          zip: 80111)
