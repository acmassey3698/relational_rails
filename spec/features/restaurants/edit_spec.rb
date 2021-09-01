require 'rails_helper'

RSpec.describe 'Restaurant edit' do
  it 'links to the edit page' do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    visit("/restaurants/#{restaurant.id}")

    click_button("Update #{restaurant.name}")

    expect(current_path).to eq("/restaurants/#{restaurant.id}/edit")
  end

  it 'can edit the restaurant name' do
    restaurant = Restaurant.create!(name: "Mcalds", delivery: false, yelp_rating: 5)

    visit("/restaurants/#{restaurant.id}")

    expect(page).to have_content('Mcalds')

    click_button('Update Mcalds')

    fill_in 'Name', with: 'McDonalds'
    click_button 'Update Restaurant'

    expect(current_path).to eq("/restaurants/#{restaurant.id}")
    expect(page).to have_content('McDonalds')
  end

  it 'can edit the restaurant delivery status' do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    visit("/restaurants/#{restaurant.id}")

    expect(page).to have_content('Mcdonalds')

    click_button('Update Mcdonalds')

    choose(option: 'true')
    click_button 'Update Restaurant'

    expect(current_path).to eq("/restaurants/#{restaurant.id}")
    expect(page).to have_content('true')
  end

  it 'can update the restaurant yelp rating' do
    restaurant = Restaurant.create!(name: "Mcdonalds", delivery: false, yelp_rating: 5)

    visit("/restaurants/#{restaurant.id}")

    expect(page).to have_content('Mcdonalds')

    click_button('Update Mcdonalds')

    fill_in 'Yelp rating', with: 4
    choose(option: 'true')
    click_button 'Update Restaurant'

    expect(current_path).to eq("/restaurants/#{restaurant.id}")
    expect(page).to have_content("Yelp Rating: 4")
  end
end
