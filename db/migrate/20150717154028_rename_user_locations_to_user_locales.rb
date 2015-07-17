class RenameUserLocationsToUserLocales < ActiveRecord::Migration
  def change
    rename_column :user_locations, :location_id, :locale_id
    rename_table :user_locations, :user_locales
  end
end
