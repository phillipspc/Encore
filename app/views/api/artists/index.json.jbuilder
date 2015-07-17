json.artists @artists.each do |artist|
  json.extract! artist,:id, :name, :description, :image_url
end
