require 'rails_helper'

RSpec.describe 'menu items index' do
  it "displays menu item names" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Chicken Sandwich", vegetarian: false, calories: 400, restaurant_id: restaurant.id)

    visit "/menu_items"

    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_2.name)
  end

  it "displays if menu item vegetarian" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Chicken Sandwich", vegetarian: false, calories: 400, restaurant_id: restaurant.id)

    visit "/menu_items"

    expect(page).to have_content(item_1.vegetarian)
    expect(page).to have_content(item_2.vegetarian)
  end

  it "displays menu item calories" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Chicken Sandwich", vegetarian: false, calories: 400, restaurant_id: restaurant.id)

    visit "/menu_items"

    expect(page).to have_content(item_1.calories)
    expect(page).to have_content(item_2.calories)
  end

  it "displays menu item ID" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Chicken Sandwich", vegetarian: false, calories: 400, restaurant_id: restaurant.id)

    visit "/menu_items"

    expect(page).to have_content(item_1.id)
    expect(page).to have_content(item_2.id)
  end

  it "displays menu item's restaurant ID" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Chicken Sandwich", vegetarian: false, calories: 400, restaurant_id: restaurant.id)

    visit "/menu_items"

    expect(page).to have_content(item_1.restaurant_id)
    expect(page).to have_content(item_2.restaurant_id)
  end

  it "displays menu item created at" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Chicken Sandwich", vegetarian: false, calories: 400, restaurant_id: restaurant.id)

    visit "/menu_items"

    expect(page).to have_content(item_1.created_at)
    expect(page).to have_content(item_2.created_at)
  end

  it "displays menu item updated at" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Chicken Sandwich", vegetarian: false, calories: 400, restaurant_id: restaurant.id)

    visit "/menu_items"

    expect(page).to have_content(item_1.updated_at)
    expect(page).to have_content(item_2.updated_at)
  end
end
