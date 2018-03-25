class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.references :province
      t.references :owner, index: true
      t.time :open_time
      t.time :close_time
      t.text :coordinates
      t.integer :status
      t.references :category, index: true

      t.datetime :deleted_at
      t.timestamps
    end
  end
end