json.extract! @user, :id, :username, :created_at, :updated_at
json.locales @user.locales do |locale|
  json.id locale.id
  json.city locale.city
  json.state locale.state
end

json.artists @user.artists do |artist|
  json.id artist.id
  json.name artist.name
  json.description artist.description
  json.image_url artist.image_url
end

json.artist_concerts @user.artist_concerts do |concert|
  json.id concert.id
  json.artist_id concert.artist_id
  json.locale_id concert.locale_id
end

json.tracked_concerts @user.tracked_concerts do |concert|
  json.id concert.id
  json.artist_name Artist.find(concert.artist_id).name
  json.locale_city Locale.find(concert.locale_id).city
  json.locale_state Locale.find(concert.locale_id).state
  json.date concert.date
end

json.locale_concerts @user.locale_concerts do |concert|
  json.id concert.id
  json.artist_name Artist.find(concert.artist_id).name
  json.locale_city Locale.find(concert.locale_id).city
  json.locale_state Locale.find(concert.locale_id).state
  json.date concert.date
end
