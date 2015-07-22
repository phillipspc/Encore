json.partial! 'api/concerts/concert', concert: @concert

json.locale do
  json.partial! 'api/locales/locale', locale: @concert.locale
end

json.artist do
  json.partial! 'api/artists/artist', artist: @concert.artist
end

json.photos @concert.concert_photos do |photo|
  json.partial! 'api/concert_photos/concert_photo', concert_photo: photo
end
