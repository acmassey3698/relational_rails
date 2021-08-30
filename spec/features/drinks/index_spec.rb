require 'rails_helper'

RSpec.describe 'Drink index' do
  it "displays all drinks that contain alcohol with their attributes" do
    pioneer = Bar.create!(name: 'Pioneer')
    rum = pioneer.drinks.create!(name: 'Rum and Coke', contains_alcohol: true, drink_rating: 5)
    water = pioneer.drinks.create!(name: 'Water', contains_alcohol: false, drink_rating: 4)

    visit '/drinks'

    expect(page).to have_content(rum.name)
    expect(page).to_not have_content(water.name)

    expect(page).to have_content(rum.contains_alcohol)
    expect(page).to have_content(rum.drink_rating)
  end
end
