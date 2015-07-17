json.concerts @concerts.each do |concert|
  json.extract! concert,:id, :artist_id, :location_id, :date
end
