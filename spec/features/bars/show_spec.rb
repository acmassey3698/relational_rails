require 'rails_helper'

RSpec.describe 'Bar Show Page' do
  it "displays the bar name" do
    bar = Bar.create!(name: 'bar', has_food: false, tabs: 4)
    bar_2 = Bar.create!(name: 'bar_2', has_food: false, tabs: 5)

    visit "/bars/#{bar.id}"

    expect(page).to have_content(bar.name)
    expect(page).to_not have_content(bar_2.name)
  end
end
