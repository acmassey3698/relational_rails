require 'rails_helper'

RSpec.describe 'Restaurant menu items index' do
  it "displays menu item names" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Chicken Sandwich", vegetarian: false, calories: 400, restaurant_id: restaurant.id)

    visit "/restaurants/#{restaurant.id}/menu_items"

    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_2.name)
  end

  it "displays menu items calories" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Chicken Sandwich", vegetarian: false, calories: 400, restaurant_id: restaurant.id)

    visit "/restaurants/#{restaurant.id}/menu_items"

    expect(page).to have_content(item_1.calories)
    expect(page).to have_content(item_2.calories)
  end

  it "displays if menu items are vegetarian" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Chicken Sandwich", vegetarian: false, calories: 400, restaurant_id: restaurant.id)

    visit "/restaurants/#{restaurant.id}/menu_items"

    expect(page).to have_content(item_1.vegetarian)
    expect(page).to have_content(item_2.vegetarian)
  end


end
