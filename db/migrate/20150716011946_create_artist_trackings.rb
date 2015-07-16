class CreateArtistTrackings < ActiveRecord::Migration
  def change
    create_table :artist_trackings do |t|
      t.integer :user_id, null: false
      t.integer :artist_id, null: false
      t.timestamps
    end
  end
end
