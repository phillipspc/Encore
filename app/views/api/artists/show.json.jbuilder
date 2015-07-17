json.extract! @artist, :id, :name, :description, :image_url
json.events @artist.events do |event|
  json.extract! event, :id, :artist_id, :location_id, :date
end
