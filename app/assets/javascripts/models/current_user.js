Encore.Models.CurrentUser = Backbone.Model.extend({
  urlRoot: '/api/session',

  locations: function () {
    if (!this._locations) {
      this._locations = new Encore.Collections.SessionLocations();
    }
    return this._locations;
  },

  artists: function () {
    if (!this._artists) {
      this._artists = new Encore.Collections.SessionArtists();
    }
    return this._artists;
  },

  parse: function (response) {
    if (response.locations) {
      this.locations().set(response.locations);
      delete response.locations;
    }
    if (response.artists) {
      this.artists().set(response.artists);
      delete response.artists;
    }
    return response;
  }
});
