class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.text :coordinates
      t.references :district
      t.references :place

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
