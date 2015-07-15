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
