class AddAttendingColumnToConcertTrackings < ActiveRecord::Migration
  def change
    add_column :concert_trackings, :attending, :boolean
  end
end
