require 'rails_helper'

RSpec.describe 'menu items index' do

  it 'displays only menu items that are vegetarian' do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Chicken Sandwich", vegetarian: false, calories: 400, restaurant_id: restaurant.id)
    item_3 = MenuItem.create!(name: "McFlurry", vegetarian:true, calories: 340, restaurant_id: restaurant.id)

    visit "/menu_items"


    expect(page).to_not have_content(item_1.name)
    expect(page).to_not have_content(item_2.name)
    expect(page).to have_content(item_3.name)
  end

  it 'links to the menu item show page when you click on the items name' do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Chicken Sandwich", vegetarian: false, calories: 400, restaurant_id: restaurant.id)
    item_3 = MenuItem.create!(name: "McFlurry", vegetarian:true, calories: 340, restaurant_id: restaurant.id)

    visit "/menu_items"

    click_on("McFlurry")

    expect(current_path).to eq("/menu_items/#{item_3.id}")
  end

  it "displays if menu item vegetarian" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Chicken Sandwich", vegetarian: false, calories: 400, restaurant_id: restaurant.id)
    item_3 = MenuItem.create!(name: "McFlurry", vegetarian:true, calories: 340, restaurant_id: restaurant.id)

    visit "/menu_items"

    expect(page).to_not have_content(item_1.vegetarian)
    expect(page).to_not have_content(item_2.vegetarian)
    expect(page).to have_content(item_3.vegetarian)
  end

  it "displays menu item calories" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Chicken Sandwich", vegetarian: false, calories: 400, restaurant_id: restaurant.id)
    item_3 = MenuItem.create!(name: "McFlurry", vegetarian:true, calories: 340, restaurant_id: restaurant.id)

    visit "/menu_items"

    expect(page).to_not have_content(item_1.calories)
    expect(page).to_not have_content(item_2.calories)
    expect(page).to have_content(item_3.calories)
  end

  it "has nav links at the top of the page" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Chicken Sandwich", vegetarian: false, calories: 400, restaurant_id: restaurant.id)
    item_3 = MenuItem.create!(name: "McFlurry", vegetarian:true, calories: 340, restaurant_id: restaurant.id)

    visit "/menu_items"

    expect(page).to have_link("Restaurants Index")
    expect(page).to have_link("Bars Index")
    expect(page).to have_link("Menu Items Index")
    expect(page).to have_link("Drinks Index")
  end

  it "Has a button beside menu items to access the items edit page" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item = MenuItem.create!(name: "McFlurry", vegetarian:true, calories: 340, restaurant_id: restaurant.id)

    visit "/menu_items"

    click_button("Edit #{item.name} Info")

    expect(current_path).to eq("/menu_items/#{item.id}/edit")
  end
end
