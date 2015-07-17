# == Schema Information
#
# Table name: locales
#
#  id         :integer          not null, primary key
#  city       :string           not null
#  state      :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class Locale < ActiveRecord::Base

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
