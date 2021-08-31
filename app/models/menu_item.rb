class MenuItem < ApplicationRecord
  belongs_to :restaurant

  def self.get_vegetarian_menu_items
    where(vegetarian: true)
  end

  def self.order_alphabetically
    order(:name)
  end 
end
