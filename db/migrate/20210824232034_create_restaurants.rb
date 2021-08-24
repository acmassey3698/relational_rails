class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.boolean :delivery
      t.integer :yelp_rating
      
      t.timestamps
    end
  end
end
