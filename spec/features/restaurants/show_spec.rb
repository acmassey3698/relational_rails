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

  it "displays restaurant id" do
    restaurant_1 = Restaurant.create!(name: 'McDonalds', delivery: false, yelp_rating: 4,)
    restaurant_2 = Restaurant.create!(name: 'Taco Bell', delivery: true, yelp_rating: 5,)

    visit "/restaurants/#{restaurant_1.id}"

    expect(page).to have_content(restaurant_1.id)
    expect(page).to_not have_content(restaurant_2.id)
  end

  it "displays restaurant created at" do
    restaurant_1 = Restaurant.create!(name: 'McDonalds', delivery: false, yelp_rating: 4,)
    restaurant_2 = Restaurant.create!(name: 'Taco Bell', delivery: true, yelp_rating: 5,)

    visit "/restaurants/#{restaurant_1.id}"

    expect(page).to have_content(restaurant_1.created_at)
  end

  it "displays restaurant updated at" do
    restaurant_1 = Restaurant.create!(name: 'McDonalds', delivery: false, yelp_rating: 4,)
    restaurant_2 = Restaurant.create!(name: 'Taco Bell', delivery: false, yelp_rating: 5,)

    visit "/restaurants/#{restaurant_1.id}"

    expect(page).to have_content(restaurant_1.updated_at)
  end

end
