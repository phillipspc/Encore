# == Schema Information
#
# Table name: locales
#
#  id    :integer          not null, primary key
#  city  :string           not null
#  state :string           not null
#

class Locale < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_by_city_or_state, against: [:city, :state]

  validates :city, :state, presence: true
  validates :city, uniqueness: true

  has_many :user_locales
  has_many :users, through: :user_locales

  has_many :concerts
  has_many :artists, through: :concerts

  def self.states
    Locale.all.select("state").uniq
  end
end
