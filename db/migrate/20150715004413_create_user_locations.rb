class CreateUserLocations < ActiveRecord::Migration
  def change
    create_table :user_locations do |t|
      t.integer :user_id, null: false
      t.integer :location_id, null: false
      t.timestamps
    end
  end
end
