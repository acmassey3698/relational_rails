class CreateMenuItems < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.boolean :vegetarian
      t.integer :calories
      t.timestamps
    end
  end
end
