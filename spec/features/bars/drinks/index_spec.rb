require 'rails_helper'

RSpec.describe 'Bars drinks index' do
  before :each do
    @pioneer = Bar.create!(name: 'Pioneer')
    @rum = @pioneer.drinks.create!(name: 'Rum and Coke', contains_alcohol: true, drink_rating: 5)
    @water = @pioneer.drinks.create!(name: 'Water', contains_alcohol: false, drink_rating: 4)
  end

  it 'shows all of the names of the drinks for the bar' do


    visit "/bars/#{@pioneer.id}/drinks"

    expect(page).to have_content(@rum.name)
    expect(page).to have_content(@water.name)
    expect(page).to have_content(@water.contains_alcohol)
    expect(page).to have_content(@water.drink_rating)
    expect(page).to have_content(@rum.contains_alcohol)
    expect(page).to have_content(@rum.drink_rating)
  end

  it 'links to each drinks show page' do
    visit "/bars/#{@pioneer.id}/drinks"

    click_on @rum.name

    expect(current_path).to eq("/drinks/#{@rum.id}")

  end

  
end
