require 'rails_helper'

RSpec.describe 'New Restaurant' do
  describe 'As a visitor' do
    describe 'When I visit the new restaurant form by clicking a link on the index' do
      xit 'I can create a new restaurant' do
        visit '/restaurants'

        click_link 'Create New Restaurant'

        expect(current_path).to eq('/restaurants/new')

        fill_in 'Name', with: 'QDoba'
        fill_in 'Yelp rating' with: 5
        click_on 'Create Restaurant'

        expect(current_path).to eq("/restaurants")
        expect(page).to have_content('QDoba')
      end
    end
  end
end
