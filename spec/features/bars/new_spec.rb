require 'rails_helper'

RSpec.describe 'New Bar' do
  describe 'As a visitor' do
    describe 'When I visit the new bar form by clicking a link on the index' do
      it 'I can create a new Bar' do
        visit '/bars'

        click_link 'Create New Bar'

        expect(current_path).to eq('/bars/new')

        fill_in 'Name', with: 'Ted'
        click_button 'Create Bar'

        new_bar_id = Bar.last.id
        expect(current_path).to eq("/bars")
        expect(page).to have_content('Ted')
      end
    end
  end
end
