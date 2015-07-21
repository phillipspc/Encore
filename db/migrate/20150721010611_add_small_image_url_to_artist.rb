class AddSmallImageUrlToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :small_image_url, :string
  end
end
