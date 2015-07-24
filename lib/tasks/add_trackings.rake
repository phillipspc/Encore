desc 'add artist trackings and concerts'
task add_trackings: :environment do
  def artist_rand
    return (1 + rand(Artist.all.length))
  end

  User.count.times do |artist_id|
    10.times do
      ArtistTracking.create({user_id: (artist_id+1), artist_id: artist_rand})
    end
  end


  artist_count = Artist.all.length
  locale_count = Locale.all.length

  def date_rand
    from = Date.today.to_time.to_f
    to = Date.today.next_year.to_time.to_f
    diff = to - from
    Time.at(from + rand(diff)).to_date
  end

  1000.times do
    artist = 1 + rand(artist_count)
    locale = 1 + rand(locale_count)

    Concert.create({artist_id: artist, locale_id: locale,
                  date: date_rand})
  end
end
