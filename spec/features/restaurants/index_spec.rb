require 'rails_helper'

RSpec.describe 'restaurants index' do
  it "displays restaurant names" do
    restaurant_1 = Restaurant.create!(name: 'McDonalds', delivery: false, yelp_rating: 4,)
    restaurant_2 = Restaurant.create!(name: 'Taco Bell', delivery: false, yelp_rating: 4,)

    visit "/restaurants"

    expect(page).to have_content(restaurant_1.name)
    expect(page).to have_content(restaurant_2.name)
  end

  it "links to the restaurant show page when you click on the restaurant name" do
    restaurant_1 = Restaurant.create!(name: 'McDonalds', delivery: false, yelp_rating: 4,)
    restaurant_2 = Restaurant.create!(name: 'Taco Bell', delivery: false, yelp_rating: 4,)

    visit "/restaurants"

    click_link('McDonalds')

    expect(current_path).to eq("/restaurants/#{restaurant_1.id}")
  end

  it "displays the nav links at the top of the page" do
    restaurant_1 = Restaurant.create!(name: 'McDonalds', delivery: false, yelp_rating: 4,)
    restaurant_2 = Restaurant.create!(name: 'Taco Bell', delivery: false, yelp_rating: 4,)

    visit "/restaurants"

    expect(page).to have_link("Restaurants Index")
    expect(page).to have_link("Bars Index")
    expect(page).to have_link("Menu Items Index")
    expect(page).to have_link("Drinks Index")
  end

  it 'has a button that takes you to a restaurants edit page' do
    restaurant_1 = Restaurant.create!(name: 'McDonalds', delivery: false, yelp_rating: 4,)
    restaurant_2 = Restaurant.create!(name: 'Taco Bell', delivery: false, yelp_rating: 4,)

    visit "/restaurants"

    click_button "Edit #{restaurant_2.name} Info"

    expect(current_path).to eq("/restaurants/#{restaurant_2.id}/edit")
  end
end
