require 'rails_helper'

RSpec.describe 'Bar Show Page' do
  it "contents" do
    bar = Bar.create!(name: 'bar', has_food: false, tabs: 4)

    visit "/bars/#{bar.id}"
    save_and_open_page
    expect(page).to have_content(bar.name)
  end
end
