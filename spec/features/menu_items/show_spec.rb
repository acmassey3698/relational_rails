require 'rails_helper'

RSpec.describe 'menu item show' do
  it "displays menu item name" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)

    visit "/menu_items/#{item_1.id}"

    expect(page).to have_content(item_1.name)
  end

  it "displays if menu item vegetarian" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)

    visit "/menu_items/#{item_1.id}"

    expect(page).to have_content(item_1.vegetarian)
  end

  it "displays menu item calories" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)

    visit "/menu_items/#{item_1.id}"

    expect(page).to have_content(item_1.calories)
  end

  it "displays item created at" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)

    visit "/menu_items/#{item_1.id}"

    expect(page).to have_content(item_1.created_at)
  end

  it "displays item updated at" do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)

    visit "/menu_items/#{item_1.id}"

    expect(page).to have_content(item_1.updated_at)
  end
end
