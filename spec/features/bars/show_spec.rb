require 'rails_helper'

RSpec.describe 'Bar Show Page' do
  it "displays the bar name and attributes" do
    bar = Bar.create!(name: 'bar', has_food: false, tabs: 4)
    bar_2 = Bar.create!(name: 'bar_2', has_food: true, tabs: 5)

    visit "/bars/#{bar.id}"

    expect(page).to have_content(bar.has_food)
    expect(page).to_not have_content(bar_2.has_food)
    expect(page).to have_content(bar.tabs)
    expect(page).to_not have_content(bar_2.tabs)
    expect(page).to have_content(bar.name)
    expect(page).to_not have_content(bar_2.name)
  end

  it "displays count of drinks" do
    bar = Bar.create!(name: 'bar', has_food: false, tabs: 4)
    bar_2 = Bar.create!(name: 'bar_2', has_food: false, tabs: 5)
    rum = bar.drinks.create!(name: 'Rum and Coke', contains_alcohol: true, drink_rating: 5)
    water = bar.drinks.create!(name: 'Water', contains_alcohol: false, drink_rating: 4)
    coke = bar.drinks.create!(name: 'Coke', contains_alcohol: false, drink_rating: 3)
    gin = bar.drinks.create!(name: 'Gin', contains_alcohol: true, drink_rating: 2)

    visit "/bars/#{bar.id}"

    expect(page).to have_content(bar.drink_count)
    expect(page).to have_no_content("Drink Count: #{bar_2.drink_count}")
  end


  it 'displays a link that takes you to the drink table page' do
    bar = Bar.create!(name: 'bar', has_food: false, tabs: 4)
    bar_2 = Bar.create!(name: 'bar_2', has_food: false, tabs: 5)
    rum = bar.drinks.create!(name: 'Rum and Coke', contains_alcohol: true, drink_rating: 5)
    water = bar.drinks.create!(name: 'Water', contains_alcohol: false, drink_rating: 4)
    coke = bar.drinks.create!(name: 'Coke', contains_alcohol: false, drink_rating: 3)
    gin = bar.drinks.create!(name: 'Gin', contains_alcohol: true, drink_rating: 2)

    visit "/bars/#{bar.id}"
    click_on "Drink Menu"

    expect(current_path).to eq("/bars/#{bar.id}/drinks")
  end

  it "has the nav links at the top of the page" do
    bar = Bar.create!(name: 'bar', has_food: false, tabs: 4)

    visit "/bars/#{bar.id}"

    expect(page).to have_link("Restaurants Index")
    expect(page).to have_link("Bars Index")
    expect(page).to have_link("Menu Items Index")
    expect(page).to have_link("Drinks Index")

  end

  # User Story 12, Parent Update (x2)
  #
  # As a visitor
  # When I visit a parent show page
  # Then I see a link to update the parent "Update Parent"
  # When I click the link "Update Parent"
  # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
  # When I fill out the form with updated information
  # And I click the button to submit the form
  # Then a `PATCH` request is sent to '/parents/:id',
  # the parent's info is updated,
  # and I am redirected to the Parent's Show page where I see the parent's updated info

  it 'links to the bar id edit page' do
    bar = Bar.create!(name: 'bar', has_food: false, tabs: 4)

    visit "/bars/#{bar.id}"

    expect(page).to have_link("Update Bar")
  end
end
