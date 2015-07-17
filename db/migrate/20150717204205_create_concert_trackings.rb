class CreateConcertTrackings < ActiveRecord::Migration
  def change
    create_table :concert_trackings do |t|
      t.integer :user_id, null: false
      t.integer :concert_id, null: false
      t.timestamps
    end
  end
end
