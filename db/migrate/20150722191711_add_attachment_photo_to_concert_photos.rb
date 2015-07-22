class AddAttachmentPhotoToConcertPhotos < ActiveRecord::Migration
  def self.up
    change_table :concert_photos do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :concert_photos, :photo
  end
end
