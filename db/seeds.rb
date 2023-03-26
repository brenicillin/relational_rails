# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
dealerships = Dealership.create!([{name: "Checkered Flag Honda",
                                  has_stock: true,
                                  year_est: 1985,
                                  created_at: 3.days.ago
                                  }, {
                                  name: "Perry Ford",
                                  has_stock: false,
                                  year_est: 1954,
                                  created_at: 13.days.ago
                                  }])
Car.create!(makemodel: "Honda Civic",
           mpg: 32,
           for_sale: true,
           cost: 13250,
           dealership_id: dealerships.first.id)
Car.create!(makemodel: "Honda CRV",
           mpg: 22,
           for_sale: true,
           cost: 12500,
           dealership_id: dealerships.first.id)
Car.create!(makemodel: "Ford Mustang",
           mpg: 21,
           for_sale: true,
           cost: 18000,
           dealership_id: dealerships.last.id)