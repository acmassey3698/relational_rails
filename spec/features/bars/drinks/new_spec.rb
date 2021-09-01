require 'rails_helper'

RSpec.describe 'Bar drink creation' do
  it "has a link to add a new drink" do
    pioneer = Bar.create!(name: 'Pioneer')
    rum = pioneer.drinks.create!(name: 'Rum and Coke', contains_alcohol: true, drink_rating: 5)
    water = pioneer.drinks.create!(name: 'Water', contains_alcohol: false, drink_rating: 4)

    visit "/bars/#{pioneer.id}/drinks"

    click_on "Add Drink"
    expect(current_path).to eq("/bars/#{pioneer.id}/drinks/new")
  end

  it "creates a new drink for that bar" do
    pioneer = Bar.create!(name: 'Pioneer')
    rum = pioneer.drinks.create!(name: 'Rum and Coke', contains_alcohol: true, drink_rating: 5)
    water = pioneer.drinks.create!(name: 'Water', contains_alcohol: false, drink_rating: 4)

    visit "/bars/#{pioneer.id}/drinks"

    click_on "Add Drink"

    fill_in 'Name', with: 'Arnold Palmer'
    fill_in 'Drink rating', with: 5

    choose(option: false)
    click_button "Create Drink"

    expect(current_path).to eq("/bars/#{pioneer.id}/drinks")
    expect(page).to have_content("Arnold Palmer")
  end
end
