json.extract! @artist, :id, :name, :description, :image_url
json.concerts @artist.concerts do |concert|
  json.extract! concert, :id, :artist_id, :locale_id, :date
end
