# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  city       :string           not null
#  state      :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class Location < ActiveRecord::Base

  validates :city, :state, presence: true
  validates :city, uniqueness: true

  has_many :user_locations
  has_many :users, through: :user_locations

  has_many :events
  has_many :artists, through: :events

  def self.states
    Location.all.select("state").uniq
  end
end
