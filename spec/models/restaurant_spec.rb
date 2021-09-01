require "rails_helper"

RSpec.describe Restaurant do
  describe 'relationships' do
    it {should have_many :menu_items}
  end 
end
