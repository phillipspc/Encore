class ChangeDefaultForAttendingColumn < ActiveRecord::Migration
  def change
    change_column_default(:concert_trackings, :attending, false)
  end
end
