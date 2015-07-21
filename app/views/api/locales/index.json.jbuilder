json.locales @locales.each do |locale|
  json.partial! 'api/locales/locale', locale: locale
end
