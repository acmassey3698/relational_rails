require 'rails_helper'

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
