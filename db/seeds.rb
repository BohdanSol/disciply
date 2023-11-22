# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

bmw = Brand.create(name: 'BMW')
Model.create(name: 'X3', brand: bmw)
Model.create(name: 'X5', brand: bmw)
Model.create(name: 'X6', brand: bmw)
Model.create(name: '3', brand: bmw)
Model.create(name: '5', brand: bmw)

audi = Brand.create(name: 'Audi')
Model.create(name: 'A3', brand: audi)
Model.create(name: 'A4', brand: audi)
Model.create(name: 'A5', brand: audi)
Model.create(name: 'A6', brand: audi)
Model.create(name: 'A8', brand: audi)
Model.create(name: 'Q5', brand: audi)
Model.create(name: 'Q7', brand: audi)
