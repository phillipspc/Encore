json.extract! @user, :id, :username, :created_at, :updated_at
json.locations @user.locations do |location|
  json.id location.id
  json.city location.city
  json.state location.state
end

json.artists @user.artists do |artist|
  json.id artist.id
  json.name artist.name
  json.description artist.description
  json.image_url artist.image_url
end
