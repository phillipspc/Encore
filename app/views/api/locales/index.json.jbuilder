json.locales @locales.each do |locale|
  json.extract! locale, :id, :city, :state
end
