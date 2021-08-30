# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Drink.destroy_all
Bar.destroy_all

MenuItem.destroy_all
Restaurant.destroy_all



@pioneer = Bar.create!(name: 'Pioneer', has_food: true, tabs: 2)
@crimson_and_gold = Bar.create!(name: 'Crimson and Gold', has_food: true, tabs: 1)
@daves = Bar.create!(name: 'Daves', has_food: false, tabs: 10)
@rum = @pioneer.drinks.create!(name: 'Rum and Coke', contains_alcohol: true, drink_rating: 5)
@water = @pioneer.drinks.create!(name: 'Water', contains_alcohol: false, drink_rating: 4)
@coke = @daves.drinks.create!(name: 'Coke', contains_alcohol: false, drink_rating: 3)
@gin = @daves.drinks.create!(name: 'Gin', contains_alcohol: true, drink_rating: 2)
@vodka = @crimson_and_gold.drinks.create!(name: 'Vodka', contains_alcohol: true, drink_rating: 5)
@whiskey = @crimson_and_gold.drinks.create!(name: 'Whiskey', contains_alcohol: true, drink_rating: 4)

@mcdonalds = Restaurant.create!(name: 'McDonalds', delivery: true, yelp_rating: 3)
@taco_bell = Restaurant.create!(name: 'Taco Bell', delivery: true, yelp_rating: 5)
@olive_garden = Restaurant.create!(name: 'Olive Garden', delivery: false, yelp_rating: 3)

@big_mac = @mcdonalds.menu_items.create!(name: "Big Mac", calories: 1000, vegetarian: false)
@mcflurry = @mcdonalds.menu_items.create!(name: "McFlurry", calories: 400, vegetarian: true)
@apple_pie = @mcdonalds.menu_items.create!(name: "Apple Pie", calories: 600, vegetarian: true)
@crunchwrap = @taco_bell.menu_items.create!(name: "Crunchwrap Supreme", calories: 500, vegetarian: false )
@bean_burrito = @taco_bell.menu_items.create!(name: "Bean Burrito", calories: 300, vegetarian: true )
@baja_blast = @taco_bell.menu_items.create!(name: "Baja Blast Freeze", calories: 280, vegetarian: true )
@carbonara = @olive_garden.menu_items.create!(name: "Carbonara", calories: 1200, vegetarian: false)
@veggie_lasagna = @olive_garden.menu_items.create!(name: "Vegetable Lasagna", calories: 700, vegetarian: true)
@breadsticks = @olive_garden.menu_items.create!(name: "Breadsticks", calories:300, vegetarian: true)
