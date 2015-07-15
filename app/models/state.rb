# == Schema Information
#
# Table name: states
#
#  id     :integer          not null, primary key
#  abbrev :string           not null
#

class State < ActiveRecord::Base
  validates :abbrev, presence: true
  validates :abbrev, uniqueness: true
end
