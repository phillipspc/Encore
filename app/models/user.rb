# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  image_url       :string
#  created_at      :datetime
#  updated_at      :datetime
#  provider        :string
#  uid             :string
#

class User < ActiveRecord::Base

  validates :username, :email, :password_digest, :session_token, presence: true
  validates :username, :email, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_session_token

  has_many :user_locales
  has_many :locales, through: :user_locales

  has_many :artist_trackings
  has_many :artists, through: :artist_trackings

  has_many :concert_trackings
  has_many :tracked_concerts, through: :concert_trackings, source: :concert
  has_many :artist_concerts, through: :artists, source: :concerts
  has_many :locale_concerts, through: :locales, source: :concerts


  attr_reader :password

  def self.find_by_username_or_email(username_or_email, password)
    input = username_or_email
    user = User.find_by_username(input) || User.find_by_email(input)
    return nil unless user && user.valid_password?(password)
    user
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.username = auth['info']['nickname']
      user.email = ("#{auth['info']['nickname']}@default.com")
      user.password = Faker::Internet.password(8)
      user.image_url = auth['info']['image']
    end
  end

  def locale_concerts
    self.artist_concerts.where(locale_id: self.locale_ids)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def valid_password?(password)
    BCrypt::Password.new(self.password_digest) == password
  end

  def reset_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save
    self.session_token
  end


  private
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

end
