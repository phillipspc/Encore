class CreateConcertPhotos < ActiveRecord::Migration
  def change
    create_table :concert_photos do |t|
      t.integer :concert_id, null: false
      t.timestamps
    end
  end
end
