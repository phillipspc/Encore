json.extract! @locale, :id, :city, :state
json.concerts @locale.concerts do |concert|
  json.extract! concert, :id, :artist_id, :locale_id, :date
end
