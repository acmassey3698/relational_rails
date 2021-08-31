require 'rails_helper'

RSpec.describe Drink, name: :model do
  describe 'relationships' do
    it {should belong_to :bar}
  end

  describe 'methods' do
    it "#get_alcoholic_drinks" do
      pioneer = Bar.create!(name: 'Pioneer')
      rum = pioneer.drinks.create!(name: 'Rum and Coke', contains_alcohol: true, drink_rating: 5)
      water = pioneer.drinks.create!(name: 'Water', contains_alcohol: false, drink_rating: 4)


      expect(Drink.get_alcoholic_drinks).to eq([rum])
    end

    it "#order_alphabetically" do
      pioneer = Bar.create!(name: 'Pioneer')
      rum = pioneer.drinks.create!(name: 'Rum and Coke', contains_alcohol: true, drink_rating: 5)
      water = pioneer.drinks.create!(name: 'Water', contains_alcohol: false, drink_rating: 4)
      ale = pioneer.drinks.create!(name: 'Ale', contains_alcohol: false, drink_rating: 4)

      expect(Drink.order_alphabetically).to eq([ale, rum, water])
    end
  end
end
