class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.float :price
      t.integer :type, default: 0

      t.timestamps
    end
  end
end
