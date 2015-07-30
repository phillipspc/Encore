class RemoveTimeStamps < ActiveRecord::Migration
  def change
    remove_column :artist_trackings, :created_at
    remove_column :artist_trackings, :updated_at
    remove_column :concert_photos, :created_at
    remove_column :concert_photos, :updated_at
    remove_column :concert_trackings, :created_at
    remove_column :concert_trackings, :updated_at
    remove_column :concerts, :created_at
    remove_column :concerts, :updated_at
    remove_column :locales, :created_at
    remove_column :locales, :updated_at
    remove_column :user_locales, :created_at
    remove_column :user_locales, :updated_at
  end
end
