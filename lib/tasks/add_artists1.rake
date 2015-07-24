desc 'add artists to the database'
task add_artists1: :environment do
  ['Fetty Wap', 'Wilco', 'Sam Hunt', 'Drake', 'Nicki Minaj', 'Rachel Platten',
  'Fall Out Boy', 'Walk The Moon', 'Meghan Trainor', 'Silento', 'Luke Bryan'].each do |name|
      artist = Artist.create({name: name})
      puts artist.name
      artist.getLargeImage
      puts artist.name + ' got large image'
      artist.getSmallImage
      puts artist.name + ' got small image'
      artist.getDescription
      puts artist.name + ' got description'
    end


end
