class RenameLocationIdColumnInEventsTable < ActiveRecord::Migration
  def change
    rename_column :concerts, :location_id, :locale_id
  end
end
