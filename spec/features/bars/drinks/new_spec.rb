#   User Story 13, Parent Child Creation (x2)
#
# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

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
