json.extract! @locale, :id, :city, :state

json.concerts @locale.concerts do |concert|
  json.id concert.id
  json.artist_name Artist.find(concert.artist_id).name
  json.date concert.date
end
