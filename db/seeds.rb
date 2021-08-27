# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@pioneer = Bar.create!(name: 'Pioneer', has_food: true, tabs: 2)
@crimson_and_gold = Bar.create!(name: 'Crimson and Gold', has_food: true, tabs: 1)
@daves = Bar.create!(name: 'Daves', has_food: false, tabs: 10)
@rum = @pioneer.drinks.create!(name: 'Rum and Coke', contains_alcohol: true, drink_rating: 5)
@water = @pioneer.drinks.create!(name: 'Water', contains_alcohol: false, drink_rating: 4)
@coke = @daves.drinks.create!(name: 'Coke', contains_alcohol: false, drink_rating: 3)
@gin = @daves.drinks.create!(name: 'Gin', contains_alcohol: true, drink_rating: 2)
@vodka = @crimson_and_gold.drinks.create!(name: 'Vodka', contains_alcohol: true, drink_rating: 5)
@whiskey = @crimson_and_gold.drinks.create!(name: 'Whiskey', contains_alcohol: true, drink_rating: 4)
