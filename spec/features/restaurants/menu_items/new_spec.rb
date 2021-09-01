require 'rails_helper'

RSpec.describe 'Restaurant menu item creation' do
  it 'has a link to add a new menu item' do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Chicken Sandwich", vegetarian: false, calories: 400, restaurant_id: restaurant.id)

    visit "/restaurants/#{restaurant.id}/menu_items"
    click_on 'Add Menu Item'

    expect(current_path).to eq("/restaurants/#{restaurant.id}/menu_items/new")
  end

  it 'creates a new menu item for that restaurant' do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Chicken Sandwich", vegetarian: false, calories: 400, restaurant_id: restaurant.id)

    visit "/restaurants/#{restaurant.id}/menu_items"
    click_link 'Add Menu Item'

    fill_in 'name', with: 'McFlurry'
    fill_in('calories', with: 400)
    choose(option: 'true')
    click_button 'Create Menu Item'

    expect(current_path).to eq("/restaurants/#{restaurant.id}/menu_items")
    expect(page).to have_content('McFlurry')
  end
end
