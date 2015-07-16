# == Schema Information
#
# Table name: artists
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  image_url   :string
#  description :text
#

class Artist < ActiveRecord::Base

  validates :name, presence: true
end
