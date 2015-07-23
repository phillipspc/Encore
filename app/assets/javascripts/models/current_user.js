Encore.Models.CurrentUser = Backbone.Model.extend({
  url: '/api/session',

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
      this.locales().set(response.locales, {parse: true});
      delete response.locales;
    }
    if (response.artists) {
      this.artists().set(response.artists, {parse: true});
      delete response.artists;
    }
    if (response.locale_concerts) {
      this.localeConcerts().set(response.locale_concerts, {parse: true});
      delete response.locale_concerts;
    }
    if (response.tracked_concerts) {
      this.trackedConcerts().set(response.tracked_concerts, {parse: true});
      delete response.tracked_concerts;
    }
    return response;
  },

  signOut: function (options) {
    var model = this;
    
    $.ajax({
      url: this.url,
      type: "DELETE",
      dataType: "json",
      success: function(data){
        model.clear();
        options.success && options.success();
      }
    });
  },

  }
});
