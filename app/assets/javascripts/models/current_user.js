Encore.Models.CurrentUser = Backbone.Model.extend({
  urlRoot: '/api/session',

  locales: function () {
    if (!this._locales) {
      this._locales = new Encore.Collections.Locales();
    }
    return this._locales;
  },

  artists: function () {
    if (!this._artists) {
      this._artists = new Encore.Collections.Artists();
    }
    return this._artists;
  },

  artistConcerts: function () {
    if (!this._artistConcerts) {
      this._artistConcerts = new Encore.Collections.Concerts();
    }
    return this._artistConcerts;
  },

  localeConcerts: function () {
    if (!this._localeConcerts) {
      this._localeConcerts = new Encore.Collections.Concerts();
    }
    return this._localeConcerts;
  },

  trackedConcerts: function () {
    if (!this._trackedConcerts) {
      this._trackedConcerts = new Encore.Collections.Concerts();
    }
    return this._trackedConcerts;
  },

  parse: function (response) {
    if (response.locales) {
      this.locales().set(response.locales);
      delete response.locales;
    }
    if (response.artists) {
      this.artists().set(response.artists);
      delete response.artists;
    }
    if (response.artist_concerts) {
      this.artistConcerts().set(response.artist_concerts);
      delete response.artist_concerts;
    }
    if (response.locale_concerts){
      this.localeConcerts().set(response.locale_concerts);
      delete response.locale_concerts;
    }
    if (response.tracked_concerts){
      this.trackedConcerts().set(response.tracked_concerts);
      delete response.tracked_concerts;
    }
    return response;
  }
});
