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
require 'addressable/uri'
require 'rest-client'

class Artist < ActiveRecord::Base
  include PgSearch
  include Enumerable

  validates :name, presence: true

  has_many :artist_trackings
  has_many :users, through: :artist_trackings

  has_many :concerts
  has_many :locales, through: :concerts

  pg_search_scope :search_by_name, against: :name, using: :trigram

  def getImages
    return if self.image_url
    url = Addressable::URI.new(
    scheme: 'https',
    host: 'api.spotify.com',
    path: 'v1/search',
    query_values: {
      q: self.name,
      type: 'artist'
    }
    ).to_s

    resp = RestClient.get(url)
    parse = JSON.parse(resp)


    if (!parse['artists']['items'].empty? &&
      parse['artists']['items'].first['images'] &&
      !parse['artists']['items'].first['images'].empty?)
      self.image_url = parse['artists']['items'].first['images'].first['url']
      self.small_image_url = parse['artists']['items'].first['images'].second['url']
    else
      self.image_url = "/assets/images/default.jpg"
      self.small_image_url = "/assets/images/default_small.jpg"
    end

    self.save!
  end


  # def getDescription
  #   url = Addressable::URI.new(
  #   scheme: 'http',
  #   host: 'developer.echonest.com',
  #   path: 'api/v4/artist/biographies',
  #   query_values: {
  #     api_key: ENV['echonest_key'],
  #     name: self.name,
  #     format: 'json',
  #     results: 1,
  #     start: 0,
  #     license: 'cc-by-sa'
  #   }
  #   ).to_s
  #
  #   resp = RestClient.get(url)
  #   parse = JSON.parse(resp)
  #
  #   if (parse['response']['biographies'])
  #     self.description = parse['response']['biographies'].first['text']
  #   else
  #     self.description = 'No bio found for this artist.'
  #   end
  #
  #   self.save!
  # end

  def self.getArtists(start)
    url = Addressable::URI.new(
    scheme: 'http',
    host: 'developer.echonest.com',
    path: 'api/v4/artist/search',
    query_values: {
      api_key: ENV['echonest_key'],
      format: 'json',
      results: 100,
      start: start,
      sort: 'hotttnesss-desc',
      bucket: 'artist_location'
    }
    ).to_s


    resp = RestClient.get(url)
    parse = JSON.parse(resp)

    if (parse['response']['status']['message'] == 'Success')

      parse['response']['artists'].each do |artist|
        next if (artist['name'][0] =~ /[^a-zA-Z0-9 -]/)

        Artist.create!({name: artist['name']})
        p 'added ' + artist['name']
      end

    end

  end

end
