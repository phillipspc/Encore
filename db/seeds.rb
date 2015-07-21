# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



["New York", "Buffalo"].each do |city|
  Locale.create({city: city, state: "NY"})
end

["Los Angeles", "San Diego", "San Jose", "San Francisco"].each do |city|
  Locale.create({city: city, state: "CA"})
end

["Richmond", "Harrisonburg", "Virginia Beach"].each do |city|
  Locale.create({city: city, state: "VA"})
end

["Philadelphia", "Lancaster", "Pittsburgh"].each do |city|
  Locale.create({city: city, state: "PA"})
end



User.create!({username: 'guest', email: 'guest@gmail.com',
            password: 'password'})


def locale_rand
  1 + rand(Locale.all.length)
end

2.times do |id|
  UserLocale.create({user_id: 1, locale_id: locale_rand})
end


['Taylor Swift', 'Kanye West', 'The War On Drugs', 'Radiohead',
  'Arctic Monkeys', 'Lana Del Rey', 'The Weeknd',
  'Katy Perry', 'Tame Impala', 'The Strokes', 'Jamie XX', 'Godspeed You Black Emperor', 'Explosions In The Sky', 'Mogwai', 'Sigur Ros', 'Wilco'].each do |name|
    Artist.create({name: name})
  end


def artist_rand
  return (1 + rand(Artist.all.length))
end

10.times do |id|
  ArtistTracking.create({user_id: 1, artist_id: artist_rand})
end

artist_count = Artist.all.length
locale_count = Locale.all.length

def date_rand
  from = Date.today.to_time.to_f
  to = Date.today.next_year.to_time.to_f
  diff = to - from
  Time.at(from + rand(diff)).to_date
end

75.times do
  artist = 1 + rand(artist_count)
  locale = 1 + rand(locale_count)

  Concert.create({artist_id: artist, locale_id: locale,
                date: date_rand})
end


# ['AL','AK','AZ','AR','CA','CO','CT','DE','FL','GA','HI','ID','IL','IN','IA',
# 'KS','KY','LA','ME','MD','MA','MI','MN','MS','MO','MT','NE','NV','NH','NJ',
# 'NM','NY','NC','ND','OH','OK','OR','PA','RI','SC','SD','TN','TX','UT','VT',
# 'VA','WA','WV','WI','WY'].each do |abbrev|
#   State.create({abbrev: abbrev})
# end
# ['Birmingham','Hoover','Montgomery','Dothan','Mobile','Decatur','Huntsville',
# 'Auburn','Tuscaloosa','Gadsden'].each do |city|
#   Locale.create({city: city, state: "AL"})
# end
#
# ["Anchorage", "Kenai", "Juneau", "Kodiak", "Fairbanks", "Bethel", "Sitka",
#   "Wasilla", "Ketchikan", "Barrow"].each do |city|
#   Locale.create({city: city, state: "AK"})
# end
#
# ["Phoenix", "Chandler", "Tucson", "Tempe", "Mesa", "Gilbert", "Glendale", "Peoria", "Scottsdale", "Yuma"].each do |city|
# Locale.create({city: city, state: "AZ"})
# end
#
# ["Little Rock", "Pine Bluff", "Fort Smith", "Springdale", "North Little Rock", "Conway", "Fayetteville", "Rogers", "Jonesboro", "Hot Springs"].each do |city|
# Locale.create({city: city, state: "AR"})
# end
#
# ["Los Angeles", "Fresno", "San Diego", "Sacramento", "San Jose", "Oakland", "San Francisco", "Santa Ana", "Long Beach", "Anaheim"].each do |city|
# Locale.create({city: city, state: "CA"})
# end
#
#
# ["Denver", "Arvada", "Colorado Springs", "Pueblo", "Aurora", "Westminster", "Lakewood", "Boulder", "Fort Collins", "Thornton"].each do |city|
# Locale.create({city: city, state: "CO"})
# end
#
#
# ["Bridgeport", "Norwalk", "New Haven", "Danbury", "Hartford", "New Britain", "Stamford", "West Hartford", "Waterbury", "Greenwich"].each do |city|
# Locale.create({city: city, state: "CT"})
# end
#
#
# ["Wilmington", "Middletown", "Dover", "Elsmere", "Newark", "Smyrna", "Milford", "New Castle", "Seaford", "Georgetown"].each do |city|
# Locale.create({city: city, state: "DE"})
# end
#
# ["Jacksonville", "Orlando", "Miami", "Fort Lauderdale", "Tampa", "Tallahassee", "St. Petersburg", "Hollywood", "Hialeah", "Pembroke Pines"].each do |city|
# Locale.create({city: city, state: "FL"})
# end
#
#
# ["Atlanta", "Macon", "Augusta-Richmond County", "Roswell", "Columbus", "Albany",
#   "Savannah", "Marietta", "Athens-Clarke County", "Warner Robins"].each do |city|
# Locale.create({city: city, state: "GA"})
# end
