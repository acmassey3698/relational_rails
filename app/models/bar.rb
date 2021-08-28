class Bar < ApplicationRecord
  has_many :drinks

  def drink_count
    drinks.length
  end
end
