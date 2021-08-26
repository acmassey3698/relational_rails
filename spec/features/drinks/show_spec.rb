require 'rails_helper'

RSpec.describe 'the drinks show page' do
  it "displays the drink name" do
    bar = Bar.create(name: 'pioneer')
    drink = bar.drinks.create!(name: "Rum and Coke", contains_alcohol: true, drink_rating: 5 )
    drink_2 = bar.drinks.create!(name: "Water", contains_alcohol: false, drink_rating: 4 )
    visit "/drinks/#{drink.id}"

    expect(page).to have_content(drink.name)
    expect(page).to_not have_content(drink_2.name)
  end

  it 'displays the name of the bar for the drink' do
    bar = Bar.create(name: 'pioneer')
    drink = bar.drinks.create!(name: "Rum and Coke", contains_alcohol: true, drink_rating: 5 )
    drink_2 = bar.drinks.create!(name: "Water", contains_alcohol: false, drink_rating: 4 )
    visit "/drinks/#{drink.id}"

    expect(page).to have_content(bar.name)
  end
end
