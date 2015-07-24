desc 'add artists to the database'
task add_artists4: :environment do
  ['Sam Smith', 'Fifth Harmony', 'Kendrick Lamar', 'Selena Gomez', 'Justin Bieber',
  'R5', 'Blake Shelton', 'Rihanna', 'Demi Lovato', 'Shawn Mendes', 'Eminem'].each do |name|
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
