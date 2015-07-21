json.partial! 'api/sessions/user', user: @user

json.locales @user.locales do |locale|
  json.partial! 'api/locales/locale', locale: locale

  # json.concerts locale.concerts do |concert|
  #   json.partial! 'api/concerts/concert', concert: concert
  # end
end

json.artists @user.artists do |artist|
  json.partial! 'api/artists/artist', artist: artist

  # json.concerts artist.concerts do |concert|
  #   json.partial! 'api/concerts/concert', concert: concert
  # end
end

# json.artist_concerts @user.artist_concerts do |concert|
#   json.partial! 'api/concerts/concert', concert: concert
#   json.locale do
#     json.partial! 'api/locales/locale', locale: concert.locale
#   end
#
#   json.artist do
#     json.artist json.partial! 'api/artists/artist', artist: concert.artist
#   end
# end

json.tracked_concerts @user.tracked_concerts do |concert|
  json.partial! 'api/concerts/concert', concert: concert
  json.locale do
    json.partial! 'api/locales/locale', locale: concert.locale
  end

  json.artist do
    json.artist json.partial! 'api/artists/artist', artist: concert.artist
  end
end

json.locale_concerts @user.locale_concerts do |concert|
  json.partial! 'api/concerts/concert', concert: concert
  json.locale do
    json.partial! 'api/locales/locale', locale: concert.locale
  end

  json.artist do
    json.artist json.partial! 'api/artists/artist', artist: concert.artist
  end
end
