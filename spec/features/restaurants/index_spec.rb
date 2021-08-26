require 'rails_helper'

RSpec.describe 'restaurants index' do
  it "displays restaurant names" do
    restaurant_1 = Restaurant.create!(name: 'McDonalds', delivery: false, yelp_rating: 4,)
    restaurant_2 = Restaurant.create!(name: 'Taco Bell', delivery: false, yelp_rating: 4,)

    visit "/restaurants"

    expect(page).to have_content(restaurant_1.name)
    expect(page).to have_content(restaurant_2.name)
  end
end
