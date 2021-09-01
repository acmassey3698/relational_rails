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

  it "displays nav links at the top of the page" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)
    other_restaurant = Restaurant.create!(name: "Taco Bell", delivery: false, yelp_rating: 4)
    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Bean Burrito", vegetarian: true, calories: 300, restaurant_id: other_restaurant.id)

    visit "/menu_items/#{item_1.id}"

    expect(page).to have_link("Restaurants Index")
    expect(page).to have_link("Bars Index")
    expect(page).to have_link("Menu Items Index")
    expect(page).to have_link("Drinks Index")
  end

  it "has a link to delete the menu item" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)
    other_restaurant = Restaurant.create!(name: "Taco Bell", delivery: false, yelp_rating: 4)
    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Bean Burrito", vegetarian: true, calories: 300, restaurant_id: other_restaurant.id)

    visit "/menu_items/#{item_1.id}"

    expect(page).to have_link("Delete Menu Item")
  end

  it "deletes the menu item when you click the delete menu item link" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)
    other_restaurant = Restaurant.create!(name: "Taco Bell", delivery: false, yelp_rating: 4)
    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Bean Burrito", vegetarian: true, calories: 300, restaurant_id: other_restaurant.id)

    visit "/menu_items/#{item_2.id}"

    click_link("Delete Menu Item")

    expect(current_path).to eq("/menu_items")

    expect(page).to_not have_content(item_2.name)
  end
end
