json.partial! 'api/artists/artist', artist: @artist

json.concerts @artist.concerts do |concert|
  json.partial! 'api/concerts/concert', concert: concert
end
