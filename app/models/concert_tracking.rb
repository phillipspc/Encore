# == Schema Information
#
# Table name: concert_trackings
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  concert_id :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class ConcertTracking < ActiveRecord::Base

  validates :user_id, :concert_id, presence: true
end
