# == Schema Information
#
# Table name: artists
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  image_url       :string
#  description     :text
#  small_image_url :string
#

class Artist < ActiveRecord::Base
  include PgSearch

  validates :name, presence: true

  has_many :artist_trackings
  has_many :users, through: :artist_trackings

  has_many :concerts
  has_many :locales, through: :concerts

  pg_search_scope :search_by_name, against: :name, using: :trigram
end
