require 'rails_helper'

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

RSpec.describe 'update bar' do


  it 'links to the bar edit page' do
    bar = Bar.create!(name: 'bar')

    visit "/bars/#{bar.id}"

    click_button("Update #{bar.name}")

    expect(current_path).to eq("/bars/#{bar.id}/edit")
  end

  it 'can update the bar attributes' do
    bar = Bar.create!(name: 'bar', has_food: false, tabs: 4)

    visit "/bars/#{bar.id}/edit"

    expect(page).to have_content('bar')

    fill_in 'Name', with: 'Ted'
    click_button 'Update Bar'

    expect(current_path).to eq("/bars/#{bar.id}")
    
    expect(page).to have_content("Ted")
  end
end
