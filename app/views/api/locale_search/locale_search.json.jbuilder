json.locales @search_results do |locale|
  json.partial! 'api/locales/locale', locale: locale
  json.num_concerts locale.concerts.count
end
