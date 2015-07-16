Encore.Collections.SessionArtists = Encore.Collections.Artists.extend({
  model: Encore.Models.SessionArtist,
  url: '/api/artists',

  comparator: 'name'
});
