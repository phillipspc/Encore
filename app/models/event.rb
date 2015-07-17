# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  artist_id   :integer          not null
#  location_id :integer          not null
#  date        :date             not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Event < ActiveRecord::Base

  validates :artist_id, :location_id, :date, presence: true

  belongs_to :artist
  belongs_to :location
end
