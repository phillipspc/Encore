json.concerts @concerts.each do |concert|
  json.partial! 'api/concerts/concert', concert: concert
end
