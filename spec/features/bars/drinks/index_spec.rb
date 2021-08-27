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
  end

  it 'links to each drinks show page' do
    visit "/bars/#{@pioneer.id}/drinks"

    click_on @rum.name

    expect(current_path).to eq("/drinks/#{@rum.id}")

  end

  it 'shows the average drink rating for the bar' do
    visit "/bars/#{@pioneer.id}/drinks"

    expect(page).to have_content("Average Drink Rating for Pioneer: 4.5")
  end
end
