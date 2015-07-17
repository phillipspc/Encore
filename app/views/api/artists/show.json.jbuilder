json.extract! @artist, :id, :name, :description, :image_url
json.concerts @artist.concerts do |concert|
  json.extract! concert, :id, :artist_id, :location_id, :date
end
