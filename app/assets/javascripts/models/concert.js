Encore.Models.Concert = Backbone.Model.extend({
  urlRoot: '/api/concerts',

  locale: function () {
    if (!this._locale) {
      this._locale = new Encore.Models.Locale();
    }
    return this._locale;
  },

  artist: function () {
    if (!this._artist) {
      this._artist = new Encore.Models.Artist();
    }
    return this._artist;
  },


  parse: function (response) {
    if (response.locale) {
      this.locale().set(response.locale);
      delete response.locale;
    }
    if (response.artist) {
      this.artist().set(response.artist);
      delete response.arist;
    }
    return response;
  },

  track: function (collection) {



  },

  untrack: function (collection) {


  }

})
