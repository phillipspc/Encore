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

json.concerts @user.concerts do |concert|
  json.id concert.id
  json.artist_id concert.artist_id
  json.locale_id concert.locale_id
end
