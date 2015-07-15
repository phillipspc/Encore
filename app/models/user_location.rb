# == Schema Information
#
# Table name: user_locations
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  location_id :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

class UserLocation < ActiveRecord::Base

  validates :user_id, :location_id, presence: true
end
