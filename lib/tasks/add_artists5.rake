desc 'add artists to the database'
task add_artists5: :environment do
  ['Mark Ronson', '5 Seconds Of Summer', 'Rae Sremmurd', 'One Direction', 'Trey Songz',
  'James Taylor', 'Between The Buried And Me', 'Kid Ink', 'Thomas Rhett', 'Owl City'].each do |name|
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
