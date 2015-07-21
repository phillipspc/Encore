json.partial! 'api/locales/locale', locale: @locale

json.concerts @locale.concerts do |concert|
  json.partial! 'api/concerts/concert', concert: concert
end
