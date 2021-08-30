require 'rails_helper'

RSpec.describe 'Bars Index' do
  it 'All of the bar names in the database as well as the order of the time they were created' do
    bar = Bar.create!(name: 'daves', has_food: false, tabs: 4, created_at: "2020-01-01")
    bar_2 = Bar.create!(name: 'teds', has_food: false, tabs: 5, created_at: "2020-01-02")
    visit "/bars"

    within "#bar-0" do
      expect(page).to have_content(bar_2.name)
      expect(page).to_not have_content(bar.name)
    end

    within "#bar-1" do
      expect(page).to have_content(bar.name)
      expect(page).to_not have_content(bar_2.name)
    end
  end


  it "has the nav links at the top of the page" do
    visit "/bars"

    expect(page).to have_link("Restaurants Index")
    expect(page).to have_link("Bars Index")
    expect(page).to have_link("Menu Items Index")
    expect(page).to have_link("Drinks Index")
  end

  it "shows the bar timestamps" do
    bar = Bar.create!(name: 'daves', has_food: false, tabs: 4, created_at: "2020-01-01")
    bar_2 = Bar.create!(name: 'teds', has_food: false, tabs: 5, created_at: "2020-01-02")
    visit "/bars"

    expect(page).to have_content(bar.created_at)
    expect(page).to have_content(bar_2.created_at)
  end

  it "has bar name links in the index" do
    bar = Bar.create!(name: 'daves', has_food: false, tabs: 4, created_at: "2020-01-01")
    bar_2 = Bar.create!(name: 'teds', has_food: false, tabs: 5, created_at: "2020-01-02")
    visit "/bars"
    click_on "daves"

    expect(current_path).to eq("/bars/#{bar.id}")
  end
end
