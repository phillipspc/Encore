class Location < ActiveRecord::Base

  validates :city, :state, presence: true
  validates :city, uniqueness: true
end
