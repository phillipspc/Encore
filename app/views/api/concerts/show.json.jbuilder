json.partial! 'api/concerts/concert', concert: @concert

json.locale do
  json.partial! 'api/locales/locale', locale: @concert.locale
end

json.artist do
  json.partial! 'api/artists/artist', artist: @concert.artist
end
