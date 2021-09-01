require 'rails_helper'

RSpec.describe 'Restaurant menu items index' do

  it "displays restaurant name" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Chicken Sandwich", vegetarian: false, calories: 400, restaurant_id: restaurant.id)

    visit "/restaurants/#{restaurant.id}/menu_items"

    expect(page).to have_content(restaurant.name)
  end

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

  it "displays the nav links at the top of the page" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Chicken Sandwich", vegetarian: false, calories: 400, restaurant_id: restaurant.id)

    visit "/restaurants/#{restaurant.id}/menu_items"

    expect(page).to have_link("Restaurants Index")
    expect(page).to have_link("Bars Index")
    expect(page).to have_link("Menu Items Index")
    expect(page).to have_link("Drinks Index")
  end

  it "Has a button beside menu items to access the items edit page" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item = MenuItem.create!(name: "McFlurry", vegetarian:true, calories: 340, restaurant_id: restaurant.id)

    visit "/restaurants/#{restaurant.id}/menu_items"

    click_button("Edit #{item.name} Info")

    expect(current_path).to eq("/menu_items/#{item.id}/edit")
  end

  it 'Has a link to alphabetize the menu items' do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Zebra Cakes", vegetarian: true, calories: 100, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_3 = MenuItem.create!(name: "Chicken Sandwich", vegetarian: false, calories: 400, restaurant_id: restaurant.id)

    visit "/restaurants/#{restaurant.id}/menu_items"

    click_link("Alphabetize")

    expect(current_url).to include("?ordered=alphabetical")
  end

  it 'alphabetizes menu items when the alphabetize link is clicked' do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Zebra Cakes", vegetarian: true, calories: 100, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_3 = MenuItem.create!(name: "Chicken Sandwich", vegetarian: false, calories: 400, restaurant_id: restaurant.id)

    visit "/restaurants/#{restaurant.id}/menu_items"

    click_link("Alphabetize")

    expect(item_2.name).to appear_before(item_1.name)
  end

  it "has a link to delete each menu item on the restaurant menu item index page" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Vegan Chicken Sandwich", vegetarian: true, calories: 400, restaurant_id: restaurant.id)
    item_3 = MenuItem.create!(name: "McFlurry", vegetarian:true, calories: 340, restaurant_id: restaurant.id)

    visit ("/restaurants/#{restaurant.id}/menu_items")

    expect(page).to have_button("Delete McFlurry")
    expect(page).to have_button("Delete Vegan Chicken Sandwich")
  end

  it "deletes the menu item when you click its delete button" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Vegan Chicken Sandwich", vegetarian: true, calories: 400, restaurant_id: restaurant.id)
    item_3 = MenuItem.create!(name: "McFlurry", vegetarian:true, calories: 340, restaurant_id: restaurant.id)

    visit ("/restaurants/#{restaurant.id}/menu_items")

    click_button("Delete #{item_3.name}")

    expect(current_path).to eq("/menu_items")
    expect(page).to_not have_content(item_3.name)
  end

  it 'filters menu items based upon a threshold given by the user' do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Vegan Chicken Sandwich", vegetarian: true, calories: 400, restaurant_id: restaurant.id)
    item_3 = MenuItem.create!(name: "McFlurry", vegetarian:true, calories: 340, restaurant_id: restaurant.id)

    visit ("/restaurants/#{restaurant.id}/menu_items")

    fill_in :search, with: 399

    click_button "Filter menu items by calories"

    expect(current_path).to eq("/restaurants/#{restaurant.id}/menu_items")
    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_2.name)
    expect(page).to_not have_content(item_3.name)
  end
end
