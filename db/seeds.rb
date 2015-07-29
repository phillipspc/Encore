# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Generates 50 city locales
###############################################################################
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
###############################################################################




# Generates Guest user account
###############################################################################

User.create!({username: 'guest', email: 'guest@gmail.com',
            password: 'password', image_url: '/assets/images/avatar.jpg'})
UserLocale.create({user_id: User.last.id, locale_id: 1})


###############################################################################





# Generates 100 faker user account, assigns 2 random locales to each
###############################################################################

# 100.times do
#   User.create!({username: Faker::Internet.user_name,
#                 email: Faker::Internet.email,
#                 password: Faker::Internet.password(8),
#                 image_url: Faker::Avatar.image})
# end
#
#
# def locale_rand
#   1 + rand(Locale.all.length)
# end
#
# User.count.times do |id|
#   2.times do
#     UserLocale.create({user_id: (id+1), locale_id: locale_rand})
#   end
# end

###############################################################################
