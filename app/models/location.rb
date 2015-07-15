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
end
