# == Schema Information
#
# Table name: concerts
#
#  id              :integer          not null, primary key
#  artist_id       :integer          not null
#  locale_id       :integer          not null
#  date            :date             not null
#  created_at      :datetime
#  updated_at      :datetime
#  small_image_url :string
#

class Concert < ActiveRecord::Base

  validates :artist_id, :locale_id, :date, presence: true

  belongs_to :artist
  belongs_to :locale

  has_many :concert_trackings
  has_many :users, through: :concert_trackings

  has_many :concert_photos
end
