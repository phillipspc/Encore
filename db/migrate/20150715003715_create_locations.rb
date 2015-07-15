class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :city, null: false
      t.string :state, null: false
      t.timestamps
    end
    add_index :locations, :city, unique: true
    add_index :locations, :state
  end
end
