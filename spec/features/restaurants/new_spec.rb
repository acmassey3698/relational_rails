require 'rails_helper'

RSpec.describe 'Restaurant creation' do
  it 'links to the new page from the restaurant index' do
    visit '/restaurants'
    click_link('Create New Restaurant')

    expect(current_path).to eq('/restaurants/new')
  end

  it 'can create a new restaurant' do
    visit '/restaurants/new'
    fill_in('name', with: 'QDoba')
    fill_in('Yelp rating', with: 5)
    choose(option: 'false')
    click_on('create restaurant')

    new_restaurant_id = Restaurant.last.id
    new_restaurant_yelp_rating = Restaurant.last.yelp_rating
    new_restaurant_delivery = Restaurant.last.delivery

    expect(current_path).to eq("/restaurants")
    expect(page).to have_content("QDoba")

    expect(new_restaurant_yelp_rating).to eq(5)
    expect(new_restaurant_delivery).to eq(false)
  end

  it "displays the nav links at the top of the page" do

    visit '/restaurants/new'

    expect(page).to have_link("Restaurants Index")
    expect(page).to have_link("Bars Index")
    expect(page).to have_link("Menu Items Index")
    expect(page).to have_link("Drinks Index")
  end
end
