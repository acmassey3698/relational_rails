# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed
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
