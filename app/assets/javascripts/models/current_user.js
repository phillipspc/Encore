Encore.Models.CurrentUser = Backbone.Model.extend({
  urlRoot: '/api/session',

  locales: function () {
    if (!this._locales) {
      this._locales = new Encore.Collections.SessionLocales();
    }
    return this._locales;
  },

  artists: function () {
    if (!this._artists) {
      this._artists = new Encore.Collections.SessionArtists();
    }
    return this._artists;
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
    return response;
  }
});
