class RenameEventsTableToConcertsTable < ActiveRecord::Migration
  def change
      rename_table :events, :concerts
  end
end
