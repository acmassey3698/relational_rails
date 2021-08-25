class CreateBars < ActiveRecord::Migration[5.2]
  def change
    create_table :bars do |t|
      t.string :name
      t.boolean :has_food
      t.integer :tabs

      t.timestamps
    end
  end
end
