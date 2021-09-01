class MenuItem < ApplicationRecord
  belongs_to :restaurant

  def self.get_vegetarian_menu_items
    where(vegetarian: true)
  end

  def self.order_alphabetically
    order(:name)
  end

  def self.menu_items_by_calories(search_value)
    where("calories > #{search_value}")
  end
end
