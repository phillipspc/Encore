# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Locale.create({city: 'New York', state: "NY"})


["Los Angeles", "San Diego", "San Jose", "San Francisco", "Fresno", "Sacramento", "Long Beach", "Oakland"].each do |city|
  Locale.create({city: city, state: "CA"})
end

Locale.create({city: 'Chicago', state: "IL"})

["Houston", "San Antonio", "Dallas", "Austin", "Fort Worth", 'El Paso', 'Arlington'].each do |city|
  Locale.create({city: city, state: "TX"})
end

Locale.create({city: "Philadelphia", state: "PA"})

["Phoenix", "Tuscon", "Mesa"].each do |city|
  Locale.create({city: city, state: "AZ"})
end

["Jacksonville", "Miami"].each do |city|
  Locale.create({city: city, state: "FL"})
end

Locale.create({city: "Indianapolis", state: "IN"})

["Columbus", "Cleveland"].each do |city|
  Locale.create({city: city, state: "OH"})
end

["Charlotte", "Raleigh"].each do |city|
  Locale.create({city: city, state: "NC"})
end

Locale.create({city: "Detroit", state: "MI"})

Locale.create({city: "Seattle", state: "WA"})

["Denver", "Colorado Springs"].each do |city|
  Locale.create({city: city, state: "CO"})
end

Locale.create({city: "Washington", state: "DC"})

["Memphis", "Nashville-Davidson"].each do |city|
  Locale.create({city: city, state: "TN"})
end

Locale.create({city: "Baltimore", state: "MD"})

["Oklahoma City", "Tulsa"].each do |city|
  Locale.create({city: city, state: "TN"})
end

Locale.create({city: "Portland", state: "OR"})

Locale.create({city: "Las Vegas", state: "NV"})

Locale.create({city: "Louisville", state: "KY"})

Locale.create({city: "Milwaukee", state: "WI"})

Locale.create({city: "Albuquerque", state: "NM"})

Locale.create({city: "Kansas City", state: "MO"})

Locale.create({city: "Atlanta", state: "GA"})

Locale.create({city: "Virginia Beach", state: "VA"})

Locale.create({city: "Omaha", state: "NE"})

Locale.create({city: "Minneapolis", state: "MN"})

Locale.create({city: "Wichita", state: "KS"})

Locale.create({city: "New Orleans", state: "LA"})






100.times do
  User.create!({username: Faker::Internet.user_name,
                email: Faker::Internet.email,
                password: Faker::Internet.password(8),
                image_url: Faker::Avatar.image})
end


def locale_rand
  1 + rand(Locale.all.length)
end

User.count.times do |id|
  2.times do
    UserLocale.create({user_id: (id+1), locale_id: locale_rand})
  end
end

User.create!({username: 'guest', email: 'guest@gmail.com',
            password: 'password'})
            
UserLocale.create({user_id: User.last.id, locale_id: 1})

['Taylor Swift', 'Kanye West', 'The War On Drugs', 'Radiohead',
  'Arctic Monkeys', 'Lana Del Rey', 'The Weeknd',
  'Katy Perry', 'Tame Impala', 'The Strokes', 'Jamie XX',
  'Godspeed You Black Emperor', 'Explosions In The Sky', 'Mogwai', 'Sigur Ros',
  'Fetty Wap', 'Wilco', 'Sam Hunt', 'Drake', 'Nicki Minaj', 'Rachel Platten',
  'Fall Out Boy', 'Walk The Moon', 'Meghan Trainor', 'Silento', 'Luke Bryan',
  'Wiz Khalifa', 'Jason Derulo', 'Andy Grammer', 'Zac Brown Band', 'Little Big Town',
  'Sam Smith', 'Fifth Harmony', 'Kendrick Lamar', 'Selena Gomez', 'Justin Bieber',
  'R5', 'Blake Shelton', 'Rihanna', 'Demi Lovato', 'Shawn Mendes', 'Eminem',
  'Joan Sebastian', 'Bruno Mars', 'Florida Georgia Line', 'Eric Church', 'Sia',
  'Tove Lo', 'Imagine Dragons', 'Chris Brown', 'David Guetta', 'Ariana Grande',
  'Jason Aldean', 'DJ Snake', 'twenty one pilots', 'Big Sean', 'Pitbull',
  'Ellie Goulding', 'Charlie Puth', 'Brantley Gilbert', 'J. Cole', 'Kid Rock',
  'Mark Ronson', '5 Seconds Of Summer', 'Rae Sremmurd', 'One Direction', 'Trey Songz',
  'James Taylor', 'Between The Buried And Me', 'Kid Ink', 'Thomas Rhett', 'Owl City',
  'Beyonce', 'X Ambassadors', 'Mumford & Sons', 'Major Lazer', 'Flo Rida',
  'Kenny Chesney', 'Hozier', 'Miguel', 'Skrillex', 'Canaan Smith', 'Echosmith',
  'Metallica', 'Omarion', 'Breaking Benjamin', 'Keith Urban', 'Jeremih', 'Diplo',
  'Nick Jonas', 'The Beatles', 'Tori Kelly', 'Carrie Underwood', 'Kelly Clarkson',
  'George Ezra', 'Chris Janson', 'Kacey Musgraves', 'Jidenna', 'T-Wayne',
  'Amy Winehouse', 'Easton Corbin', 'Journey', 'Tyrese', "Meek Mill",
  "Ed Sheeran", "OMI", "Maroon 5"].each do |name|
    Artist.create({name: name})
  end









def artist_rand
  return (1 + rand(Artist.all.length))
end

User.count.times do |artist_id|
  10.times do
    ArtistTracking.create({user_id: (artist_id+1), artist_id: artist_rand})
  end
end


artist_count = Artist.all.length
locale_count = Locale.all.length

def date_rand
  from = Date.today.to_time.to_f
  to = Date.today.next_year.to_time.to_f
  diff = to - from
  Time.at(from + rand(diff)).to_date
end

1000.times do
  artist = 1 + rand(artist_count)
  locale = 1 + rand(locale_count)

  Concert.create({artist_id: artist, locale_id: locale,
                date: date_rand})
end
