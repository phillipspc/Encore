json.concerts @concerts.each do |concert|
  json.extract! concert,:id, :artist_id, :locale_id, :date
end
