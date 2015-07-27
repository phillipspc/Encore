desc 'add artists to the database'
task add_artists6: :environment do
  ['Tyrese', "Meek Mill", "Ed Sheeran", "OMI", "Maroon 5"].each do |name|
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
