require 'rails_helper'

RSpec.describe Drink, name: :model do
  describe 'relationships' do
    it {should belong_to :bar}
  end
end
