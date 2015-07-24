desc 'add artists to the database'
task add_artists: :environment do
  ['Taylor Swift', 'Kanye West', 'The War On Drugs', 'Radiohead',
    'Arctic Monkeys', 'Lana Del Rey', 'The Weeknd',
    'Katy Perry', 'Tame Impala', 'The Strokes', 'Jamie XX',
    'Godspeed You Black Emperor', 'Explosions In The Sky', 'Mogwai', 'Sigur Ros'].each do |name|
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
