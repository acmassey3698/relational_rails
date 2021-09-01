require 'rails_helper'

RSpec.describe 'restaurants show' do
  it "displays restaurant name" do
    restaurant_1 = Restaurant.create!(name: 'McDonalds', delivery: false, yelp_rating: 4,)
    restaurant_2 = Restaurant.create!(name: 'Taco Bell', delivery: true, yelp_rating: 5,)

    visit "/restaurants/#{restaurant_1.id}"

    expect(page).to have_content(restaurant_1.name)
    expect(page).to_not have_content(restaurant_2.name)
  end

  it "displays restaurant yelp rating" do
    restaurant_1 = Restaurant.create!(name: 'McDonalds', delivery: false, yelp_rating: 4,)
    restaurant_2 = Restaurant.create!(name: 'Taco Bell', delivery: true, yelp_rating: 5,)

    visit "/restaurants/#{restaurant_1.id}"

    expect(page).to have_content(restaurant_1.yelp_rating)
    expect(page).to_not have_content("Yelp Rating: #{restaurant_2.yelp_rating}")
  end

  it "displays restaurant delivery" do
    restaurant_1 = Restaurant.create!(name: 'McDonalds', delivery: false, yelp_rating: 4,)
    restaurant_2 = Restaurant.create!(name: 'Taco Bell', delivery: true, yelp_rating: 5,)

    visit "/restaurants/#{restaurant_1.id}"

    expect(page).to have_content(restaurant_1.delivery)
    expect(page).to_not have_content(restaurant_2.delivery)
  end

  it "displays the nav links at the top of the page" do
    restaurant_1 = Restaurant.create!(name: 'McDonalds', delivery: false, yelp_rating: 4,)
    restaurant_2 = Restaurant.create!(name: 'Taco Bell', delivery: true, yelp_rating: 5,)

    visit "/restaurants/#{restaurant_1.id}"

    expect(page).to have_link("Restaurants Index")
    expect(page).to have_link("Bars Index")
    expect(page).to have_link("Menu Items Index")
    expect(page).to have_link("Drinks Index")
  end

  it "has a link to delete the restaurant" do
    restaurant_1 = Restaurant.create!(name: 'McDonalds', delivery: false, yelp_rating: 4,)
    restaurant_2 = Restaurant.create!(name: 'Taco Bell', delivery: true, yelp_rating: 5,)

    visit "/restaurants/#{restaurant_1.id}"

    expect(page).to have_link("Delete Restaurant")
  end

  it "deletes the restaurant and all of its menu items" do
    restaurant_1 = Restaurant.create!(name: 'McDonalds', delivery: false, yelp_rating: 4,)
    restaurant_2 = Restaurant.create!(name: 'Taco Bell', delivery: true, yelp_rating: 5,)

    visit "/restaurants/#{restaurant_1.id}"

    click_link("Delete Restaurant")

    expect(current_path).to eq("/restaurants")

    expect(page).to_not have_content("McDonalds")
  end
end
