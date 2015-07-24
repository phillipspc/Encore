json.locales @search_results do |locale|
  json.partial! 'api/locales/locale', locale: locale
end
