require 'rails_helper'

RSpec.describe 'menu item show' do
  it "displays menu item name" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)
    other_restaurant = Restaurant.create!(name: "Taco Bell", delivery: false, yelp_rating: 4)
    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Bean Burrito", vegetarian: true, calories: 300, restaurant_id: other_restaurant.id)

    visit "/menu_items/#{item_1.id}"

    expect(page).to have_content(item_1.name)
  end

  it "displays if menu item vegetarian" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)
    other_restaurant = Restaurant.create!(name: "Taco Bell", delivery: false, yelp_rating: 4)
    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Bean Burrito", vegetarian: true, calories: 300, restaurant_id: other_restaurant.id)

    visit "/menu_items/#{item_1.id}"

    expect(page).to have_content(item_1.vegetarian)
  end

  it "displays menu item calories" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)
    other_restaurant = Restaurant.create!(name: "Taco Bell", delivery: false, yelp_rating: 4)
    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Bean Burrito", vegetarian: true, calories: 300, restaurant_id: other_restaurant.id)

    visit "/menu_items/#{item_1.id}"

    expect(page).to have_content(item_1.calories)
  end
end
