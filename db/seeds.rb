# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customer = Customer.create!(first_name: "Alaina", last_name: "Kneiling" , in_usa: true, credit_score: 801 )
order1 = customer.orders.create!(quantity: 1, gift: true, order_type: "green shirt")
order2 = customer.orders.create!(quantity: 3, gift: true, order_type: "polly pockets")