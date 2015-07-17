class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :artist_id, null: false
      t.integer :location_id, null: false
      t.date :date, null: false
      t.timestamps
    end
  end
end
