desc 'add artists to the database'
task add_artists1: :environment do
  ['Fetty Wap', 'Wilco', 'Sam Hunt', 'Drake', 'Nicki Minaj', 'Rachel Platten',
  'Fall Out Boy', 'Walk The Moon', 'Meghan Trainor', 'Silento', 'Luke Bryan',
  'Wiz Khalifa', 'Jason Derulo', 'Andy Grammer', 'Zac Brown Band', 'Little Big Town',
  'Sam Smith', 'Fifth Harmony', 'Kendrick Lamar', 'Selena Gomez', 'Justin Bieber',
  'R5', 'Blake Shelton', 'Rihanna', 'Demi Lovato', 'Shawn Mendes', 'Eminem',
  'Joan Sebastian', 'Bruno Mars', 'Florida Georgia Line', 'Eric Church', 'Sia'].each do |name|
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
