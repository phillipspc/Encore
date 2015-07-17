json.extract! @concert, :id, :artist_id, :locale_id, :date
json.locale @concert.locale, :id, :city, :state
json.artist @concert.artist, :id, :name, :description, :image_url
