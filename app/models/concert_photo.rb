# == Schema Information
#
# Table name: concert_photos
#
#  id                 :integer          not null, primary key
#  concert_id         :integer          not null
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

class ConcertPhoto < ActiveRecord::Base

  validates :concert_id, presence: true
  belongs_to :concert

  has_attached_file :photo
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
