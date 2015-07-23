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

  photos: function () {
    if (!this._photos) {
      this._photos = new Encore.Collections.ConcertPhotos();
    }
    return this._photos;
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
    if (response.photos) {
      this.photos().set(response.photos);
      delete response.photos;
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
  },

  getSmallImage: function () {
    var that = this;
    if (this.artist().get('name')) {
      $.ajax({
        url: 'https://api.spotify.com/v1/search',
        data: {
            q: that.artist().get('name'),
            type: 'artist'
        },
        success: function (response) {
            if (!response.artists.items[0]) {
              that.set({small_image_url: "/assets/images/default_small.jpg"});
              that.save();
              that.trigger('sync');
            } else {
              that.set({small_image_url: response.artists.items[0].images[2].url});
              that.save();
              that.trigger('sync');
            }
        }
      });
    }
  }

})
