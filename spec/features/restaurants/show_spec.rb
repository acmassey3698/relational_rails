require 'rails_helper'

RSpec.describe 'restaurants show' do
  it "displays restaurant names" do
    restaurant_1 = Restaurant.create!(name: 'McDonalds', delivery: false, yelp_rating: 4,)
    restaurant_2 = Restaurant.create!(name: 'Taco Bell', delivery: false, yelp_rating: 4,)

    visit "/restaurants/#{restaurant_1.id}"

    expect(page).to have_content(restaurant_1.name)
    expect(page).to have_content(restaurant_1.delivery)
    expect(page).to have_content(restaurant_1.yelp_rating)
    expect(page).to have_content(restaurant_1.created_at)
    expect(page).to have_content(restaurant_1.updated_at)


    expect(page).to_not have_content(restaurant_2.name)
  end
end
