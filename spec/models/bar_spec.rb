require 'rails_helper'

RSpec.describe Bar do
  it {should have_many :drinks}

  describe 'instance methods' do
    describe '#drink_count' do
      before :each do
        @pioneer = Bar.create!(name: 'Pioneer')
        @rum = @pioneer.drinks.create!(name: 'Rum and Coke', contains_alcohol: true, drink_rating: 5)
        @water = @pioneer.drinks.create!(name: 'Water', contains_alcohol: false, drink_rating: 4)
      end

      it 'returns the amount of drinks' do
        expect(@pioneer.drink_count).to eq(2)
      end
    end
  end
end
