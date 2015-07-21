class AddColumnSmallImageUrlToConcerts < ActiveRecord::Migration
  def change
    add_column :concerts, :small_image_url, :string
  end
end
