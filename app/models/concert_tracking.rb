# == Schema Information
#
# Table name: concert_trackings
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  concert_id :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  attending  :boolean          default(FALSE)
#

class ConcertTracking < ActiveRecord::Base

  validates :user_id, :concert_id, presence: true
  belongs_to :user
  belongs_to :concert

  # after_initialize :ensure_attending

  # private
  # def ensure_attending
  #   self.attending ||= false
  # end
end
