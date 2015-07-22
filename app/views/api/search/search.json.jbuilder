json.artists @search_results do |artist|
  json.partial! 'api/artists/artist', artist: artist
end
