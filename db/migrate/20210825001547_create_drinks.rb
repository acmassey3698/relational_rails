class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.string :name
      t.boolean :contains_alcohol
      t.integer :drink_rating
      t.timestamps
    end
  end
end
