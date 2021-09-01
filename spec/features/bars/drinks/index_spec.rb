require 'rails_helper'

RSpec.describe 'Bars drinks index' do
  before :each do
    @pioneer = Bar.create!(name: 'Pioneer')
    @rum = @pioneer.drinks.create!(name: 'Rum and Coke', contains_alcohol: true, drink_rating: 5)
    @water = @pioneer.drinks.create!(name: 'Water', contains_alcohol: false, drink_rating: 4)
    @ale = @pioneer.drinks.create!(name: 'Ale', contains_alcohol: false, drink_rating: 4)
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

  it 'Has the nav links at the top of the page' do
    visit "/bars/#{@pioneer.id}/drinks"

    expect(page).to have_link("Restaurants Index")
    expect(page).to have_link("Bars Index")
    expect(page).to have_link("Menu Items Index")
    expect(page).to have_link("Drinks Index")
  end

  it "has a link to alphabetize the bar drinks" do
    visit "/bars/#{@pioneer.id}/drinks"
    click_link "Alphabetize"

    expect(current_url).to include("?ordered=alphabetical")

  end

  it "Alphabetizes drinks when the alphabetize button is clicked" do
    visit "/bars/#{@pioneer.id}/drinks"
    click_link "Alphabetize"

    expect(@ale.name).to appear_before(@water.name)

  end

#   [ ] done
#
# User Story 21, Display Records Over a Given Threshold (x2)
#
# As a visitor
# When I visit the Parent's children Index Page
# I see a form that allows me to input a number value
# When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
# Then I am brought back to the current index page with only the records that meet that threshold shown.
  it 'Filters drinks that are greater than the threshold' do
    visit "/bars/#{@pioneer.id}/drinks"

    expect(page).to have_field(:search)

    fill_in :search, with: 4

    click_button "Filter drink by rating"


    expect(current_path).to eq("/bars/#{@pioneer.id}/drinks")
    expect(page).to have_content(@rum.name)
    expect(page).not_to have_content(@water.name)
  end
end
