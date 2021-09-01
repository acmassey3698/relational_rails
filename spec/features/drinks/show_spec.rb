require 'rails_helper'

RSpec.describe 'the drinks show page' do

  it 'displays the name of the bar and attributes' do
    bar = Bar.create(name: 'pioneer')
    drink = bar.drinks.create!(name: "Rum and Coke", contains_alcohol: true, drink_rating: 5 )
    drink_2 = bar.drinks.create!(name: "Water", contains_alcohol: false, drink_rating: 4 )
    visit "/drinks/#{drink.id}"

    expect(page).to have_content(bar.name)
    expect(page).to have_content(drink.name)
    expect(page).to have_content(drink.contains_alcohol)
    expect(page).to have_content(drink.drink_rating)
    expect(page).to_not have_content(drink_2.name)
    expect(page).to_not have_content(drink_2.contains_alcohol)
    expect(page).to_not have_content(drink_2.drink_rating)
  end

  it "displays nav links at the top of the page" do
    bar = Bar.create(name: 'pioneer')
    drink = bar.drinks.create!(name: "Rum and Coke", contains_alcohol: true, drink_rating: 5 )

    visit "/drinks/#{drink.id}"

    expect(page).to have_link("Restaurants Index")
    expect(page).to have_link("Bars Index")
    expect(page).to have_link("Menu Items Index")
    expect(page).to have_link("Drinks Index")
  end

  it "can delete the drink from the show page" do
    bar = Bar.create!(name: 'davids', has_food: false, tabs: 4)
    drink = bar.drinks.create!(name: "Rum and Coke", contains_alcohol: true, drink_rating: 5 )

    visit "/drinks/#{drink.id}"
    click_button 'Delete'

    expect(current_path).to eq("/drinks")
    expect(page).to_not have_content(drink.name)
  end
end
