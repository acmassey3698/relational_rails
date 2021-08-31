class Drink < ApplicationRecord
  belongs_to :bar

  def self.get_alcoholic_drinks
    where(contains_alcohol: true)
  end
end
