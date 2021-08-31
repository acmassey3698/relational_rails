# [ ] done
#
# User Story 14, Child Update (x2)
#
# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information

require 'rails_helper'

RSpec.describe 'Edit drinks' do
  it "Links to a page where you can edit the drink" do
    pioneer = Bar.create!(name: 'Pioneer')
    rum = pioneer.drinks.create!(name: 'Rum and Coke', contains_alcohol: true, drink_rating: 5)
    water = pioneer.drinks.create!(name: 'Water', contains_alcohol: false, drink_rating: 4)

    visit "/drinks/#{rum.id}"

    click_link "Edit Drink"

    expect(current_path).to eq("/drinks/#{rum.id}/edit")
  end

  it "Can edit the Drink attributes" do
    pioneer = Bar.create!(name: 'Pioneer')
    rum = pioneer.drinks.create!(name: 'Rum and Sprite', contains_alcohol: true, drink_rating: 5)
    water = pioneer.drinks.create!(name: 'Water', contains_alcohol: false, drink_rating: 4)

    visit "/drinks/#{rum.id}"

    click_link "Edit Drink"

    fill_in "Name", with: "Rum and Coke"
    fill_in "Drink rating", with: 2

    choose(option: false)

    click_button "Update Drink"

    expect(current_path).to eq("/drinks/#{rum.id}")
    expect(page).to have_content("Rum and Coke")
    expect(page).to have_content(2)
    expect(page).to have_content(false)
  end
end
