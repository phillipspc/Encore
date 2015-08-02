desc 'add 1000 artists to database seed'
task add_artists: :environment do
  Artist.getArtists(0)
  Artist.getArtists(100)
  Artist.getArtists(200)
  Artist.getArtists(300)
  Artist.getArtists(400)
  Artist.getArtists(500)
  Artist.getArtists(600)
  Artist.getArtists(700)
  Artist.getArtists(800)
  Artist.getArtists(900)
end
