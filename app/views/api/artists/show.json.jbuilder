json.extract! @artist, :id, :name, :description, :image_url
json.concerts @artist.concerts do |concert|
  json.id concert.id
  json.artist_name Artist.find(concert.artist_id).name
  json.locale_city Locale.find(concert.locale_id).city
  json.locale_state Locale.find(concert.locale_id).state
  json.date concert.date
end
