# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



["New York", "Buffalo"].each do |city|
  Location.create({city: city, state: "NY"})
end

["Los Angeles", "San Diego", "San Jose", "San Francisco"].each do |city|
  Location.create({city: city, state: "CA"})
end

["Richmond", "Harrisonburg", "Virginia Beach"].each do |city|
  Location.create({city: city, state: "VA"})
end

["Philadelphia", "Lancaster", "Pittsburgh"].each do |city|
  Location.create({city: city, state: "PA"})
end


User.create!({username: 'phillipspc', email: 'phillipspc@gmail.com',
            password: 'password'})

User.create!({username: 'guest', email: 'guest@gmail.com',
            password: 'password'})

UserLocation.create({user_id: 1, location_id: 1})
UserLocation.create({user_id: 1, location_id: 10})

UserLocation.create({user_id: 2, location_id: 1})
UserLocation.create({user_id: 2, location_id: 10})


['Taylor swift', 'Kanye West', 'The War On Drugs', 'Radiohead',
  'Arctic Monkeys', 'Lana Del Rey', 'The Weeknd',
  'Katy Perry', 'Tame Impala', 'The Strokes'].each do |name|
    Artist.create({name: name})
  end


10.times do |id|
  ArtistTracking.create({user_id: 2, artist_id: (id+1)})
end

artist_count = Artist.all.length
location_count = Location.all.length

def date_rand
  from = Date.today.to_time.to_f
  to = Date.today.next_year.to_time.to_f
  diff = to - from
  Time.at(from + rand(diff)).to_date
end

50.times do
  artist = 1 + rand(artist_count)
  location = 1 + rand(location_count)

  Event.create({artist_id: artist, location_id: location, 
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
#   Location.create({city: city, state: "AL"})
# end
#
# ["Anchorage", "Kenai", "Juneau", "Kodiak", "Fairbanks", "Bethel", "Sitka",
#   "Wasilla", "Ketchikan", "Barrow"].each do |city|
#   Location.create({city: city, state: "AK"})
# end
#
# ["Phoenix", "Chandler", "Tucson", "Tempe", "Mesa", "Gilbert", "Glendale", "Peoria", "Scottsdale", "Yuma"].each do |city|
# Location.create({city: city, state: "AZ"})
# end
#
# ["Little Rock", "Pine Bluff", "Fort Smith", "Springdale", "North Little Rock", "Conway", "Fayetteville", "Rogers", "Jonesboro", "Hot Springs"].each do |city|
# Location.create({city: city, state: "AR"})
# end
#
# ["Los Angeles", "Fresno", "San Diego", "Sacramento", "San Jose", "Oakland", "San Francisco", "Santa Ana", "Long Beach", "Anaheim"].each do |city|
# Location.create({city: city, state: "CA"})
# end
#
#
# ["Denver", "Arvada", "Colorado Springs", "Pueblo", "Aurora", "Westminster", "Lakewood", "Boulder", "Fort Collins", "Thornton"].each do |city|
# Location.create({city: city, state: "CO"})
# end
#
#
# ["Bridgeport", "Norwalk", "New Haven", "Danbury", "Hartford", "New Britain", "Stamford", "West Hartford", "Waterbury", "Greenwich"].each do |city|
# Location.create({city: city, state: "CT"})
# end
#
#
# ["Wilmington", "Middletown", "Dover", "Elsmere", "Newark", "Smyrna", "Milford", "New Castle", "Seaford", "Georgetown"].each do |city|
# Location.create({city: city, state: "DE"})
# end
#
# ["Jacksonville", "Orlando", "Miami", "Fort Lauderdale", "Tampa", "Tallahassee", "St. Petersburg", "Hollywood", "Hialeah", "Pembroke Pines"].each do |city|
# Location.create({city: city, state: "FL"})
# end
#
#
# ["Atlanta", "Macon", "Augusta-Richmond County", "Roswell", "Columbus", "Albany",
#   "Savannah", "Marietta", "Athens-Clarke County", "Warner Robins"].each do |city|
# Location.create({city: city, state: "GA"})
# end
