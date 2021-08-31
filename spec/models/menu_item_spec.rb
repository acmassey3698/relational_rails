require 'rails_helper'

RSpec.describe MenuItem do
  it {should belong_to :restaurant}

  it 'gets vegetarian menu items' do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Zebra Cakes", vegetarian: true, calories: 100, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_3 = MenuItem.create!(name: "Chicken Sandwich", vegetarian: false, calories: 400, restaurant_id: restaurant.id)

    expect(MenuItem.get_vegetarian_menu_items).to eq([item_1])
  end

  it 'orders items alphabetically' do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    item_1 = MenuItem.create!(name: "Zebra Cakes", vegetarian: true, calories: 100, restaurant_id: restaurant.id)
    item_2 = MenuItem.create!(name: "Big Mac", vegetarian: false, calories: 1000, restaurant_id: restaurant.id)
    item_3 = MenuItem.create!(name: "Chicken Sandwich", vegetarian: false, calories: 400, restaurant_id: restaurant.id)

    expect(MenuItem.order_alphabetically).to eq([item_2, item_3, item_1])
  end
end
