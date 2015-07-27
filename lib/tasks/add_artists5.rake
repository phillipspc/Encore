desc 'add artists to the database'
task add_artists5: :environment do
  ['Sufjan Stevens', 'Angel Olsen', 'Sylvan Esso', 'Miley Cyrus', 'Pharrell Williams',
  'Lorde', 'Coldplay', 'Iggy Azalea', 'Bastille', 'Vampire Weekend', 'The National'].each do |name|
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
