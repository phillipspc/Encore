desc 'add artists to the database'
task add_artists3: :environment do
  ['Kenny Chesney', 'Hozier', 'Miguel', 'Skrillex', 'Canaan Smith', 'Echosmith',
  'Metallica', 'Breaking Benjamin', 'Keith Urban', 'Jeremih', 'Diplo',
  'Nick Jonas', 'The Beatles', 'Tori Kelly', 'Carrie Underwood', 'Kelly Clarkson',
  'George Ezra', 'Chris Janson', 'Kacey Musgraves', 'Jidenna', 'T-Wayne',
  'Amy Winehouse', 'Easton Corbin', 'Journey', 'Tyrese', "Meek Mill",
  "Ed Sheeran", "OMI", "Maroon 5"].each do |name|
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
