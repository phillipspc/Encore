desc 'add artists to the database'
task add_artists3: :environment do
  ['George Ezra', 'Chris Janson', 'Kacey Musgraves', 'Jidenna', 'T-Wayne',
  'Amy Winehouse', 'Easton Corbin', 'Journey', 'Tyrese'].each do |name|
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
