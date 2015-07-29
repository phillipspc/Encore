desc 'get artist image urls'
task get_images: :environment do
  Artist.all.each do |artist|
    artist.getImages
    p 'got images for ' + artist.id.to_s + ' ' + artist.name
  end
end
