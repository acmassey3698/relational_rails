require 'rails_helper'

RSpec.describe 'restaurants index' do
  it "displays restaurant names" do
    restaurant_1 = Restaurant.create!(name: 'McDonalds', delivery: false, yelp_rating: 4,)
    restaurant_2 = Restaurant.create!(name: 'Taco Bell', delivery: false, yelp_rating: 4,)

    visit "/restaurants"

    expect(page).to have_content(restaurant_1.name)
    expect(page).to have_content(restaurant_2.name)
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
end
