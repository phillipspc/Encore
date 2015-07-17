# == Schema Information
#
# Table name: user_locales
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  locale_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class UserLocale < ActiveRecord::Base

  validates :user_id, :locale_id, presence: true

  belongs_to :user
  belongs_to :locale
end
