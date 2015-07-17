class RenameLocationsToLocales < ActiveRecord::Migration
  def change
    rename_table :locations, :locales
  end
end
