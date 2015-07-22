Encore.Collections.SearchResults = Backbone.Collection.extend({
  url: 'api/search',

  artists: function () {
    if (!this._artists) {
      this._artists = new Encore.Collections.Artists();
    }
    return this._artists;
  },

  parse: function (response) {
    if (response.artists) {
      this.artists().set(response.artists);
      delete response.artists;
    }
    return response;
  }

});
