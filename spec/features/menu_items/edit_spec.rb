require 'rails_helper'

RSpec.describe 'edit menu items' do
  it 'links to a page where you can edit menu items' do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Chicken Sandwich", vegetarian: false, calories: 400, restaurant_id: restaurant.id)

    visit "/menu_items/#{item_1.id}"

    click_link "Edit #{item_1.name}"

    expect(current_path).to eq("/menu_items/#{item_1.id}/edit")
  end

  it 'can edit the restaurant name' do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mick", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Chicken Sandwich", vegetarian: false, calories: 400, restaurant_id: restaurant.id)

    visit "/menu_items/#{item_1.id}"

    click_link "Edit #{item_1.name}"

    fill_in 'name', with: 'Big Mac'
    click_button "Update Menu Item"

    expect(current_path).to eq("/menu_items/#{item_1.id}")
    expect(page).to have_content("Big Mac")
  end

  it 'can edit the number of calories' do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 0, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Chicken Sandwich", vegetarian: false, calories: 400, restaurant_id: restaurant.id)

    visit "/menu_items/#{item_1.id}"

    click_link "Edit #{item_1.name}"

    fill_in 'calories', with: 1000
    click_button "Update Menu Item"

    expect(current_path).to eq("/menu_items/#{item_1.id}")
    expect(page).to have_content("1000")
  end

  it 'can change the vegetarian status' do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 0, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Chicken Sandwich", vegetarian: false, calories: 400, restaurant_id: restaurant.id)

    visit "/menu_items/#{item_1.id}"

    click_link "Edit #{item_1.name}"

    choose(option: 'true')
    click_button "Update Menu Item"

    expect(current_path).to eq("/menu_items/#{item_1.id}")
    expect(page).to have_content("true")
  end
end
