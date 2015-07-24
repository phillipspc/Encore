desc 'add artists to the database'
task add_artists: :environment do
  ['Taylor Swift', 'Kanye West', 'The War On Drugs', 'Radiohead',
    'Arctic Monkeys', 'Lana Del Rey', 'The Weeknd',
    'Katy Perry', 'Tame Impala', 'The Strokes', 'Jamie XX',
    'Godspeed You Black Emperor', 'Explosions In The Sky', 'Mogwai', 'Sigur Ros'].each do |name|
      artist = Artist.create({name: name})
      p artist.name
      artist.getLargeImage
      p artist.name + ' got large image'
      artist.getSmallImage
      p artist.name + ' got small image'
      artist.getDescription
      p artist.name + ' got description'
    end


end
