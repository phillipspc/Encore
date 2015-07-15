json.extract! @user, :id, :username, :created_at, :updated_at
json.locations @user.locations do |location|
  json.id location.id
  json.city location.city
  json.state location.state
end
