desc 'add artists to the database'
task add_artists2: :environment do
  ['Tove Lo', 'Imagine Dragons', 'Chris Brown', 'David Guetta', 'Ariana Grande',
  'Jason Aldean', 'DJ Snake', 'twenty one pilots', 'Big Sean', 'Pitbull',
  'Ellie Goulding', 'Charlie Puth', 'Brantley Gilbert', 'J. Cole', 'Kid Rock',
  'Mark Ronson', '5 Seconds Of Summer', 'Rae Sremmurd', 'One Direction', 'Trey Songz',
  'James Taylor', 'Between The Buried And Me', 'Kid Ink', 'Thomas Rhett', 'Owl City',
  'Beyonce', 'X Ambassadors', 'Mumford & Sons', 'Major Lazer', 'Flo Rida'].each do |name|
      artist = Artist.create({name: name})
      artist.getLargeImage
      artist.getSmallImage
      artist.getDescription
    end


end
