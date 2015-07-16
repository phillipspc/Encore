# == Schema Information
#
# Table name: artist_trackings
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  artist_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class ArtistTracking < ActiveRecord::Base

  validates :user_id, :artist_id, presence: true
end
