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

  date: function () {
    if (this.escape('date')) {
    var date = Date.parse(this.escape('date')).toString("dddd, MMMM d, yyyy");
    return date;
    }
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
    var that = this;
    $.ajax({
      url: '/api/concerts/' + that.id + '/concert_tracking',
      type: 'POST',
      success: function () {
        collection.add(that);
        that.trigger('sync');
      }
    });
  },

  untrack: function (collection) {
    var that = this;
    $.ajax({
      url: '/api/concerts/' + that.id + '/concert_tracking',
      type: 'DELETE',
      success: function () {
        collection.remove(that);
        that.trigger('sync');
      }
    });
  }

})
