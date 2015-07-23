Encore.Models.Artist = Backbone.Model.extend({
  urlRoot: '/api/artists',

  concerts: function () {
    if (!this._concerts) {
      this._concerts = new Encore.Collections.Concerts();
    }
    return this._concerts;
  },

  parse: function (response) {
    if (response.concerts) {
      this.concerts().set(response.concerts, {parse: true});
      delete response.concerts;
    }
    return response;
  },

  track: function (collection) {
    var that = this;
    $.ajax({
      url: '/api/artists/' + that.id + '/artist_tracking',
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
      url: '/api/artists/' + that.id + '/artist_tracking',
      type: 'DELETE',
      success: function () {
        collection.remove(that);
        that.trigger('sync');
      }
    });

  },

  getLargeImage: function () {
    var that = this;
    if (this.get('name')) {
      $.ajax({
        url: 'https://api.spotify.com/v1/search',
        data: {
            q: that.get('name'),
            type: 'artist'
        },
        success: function (response) {
            that.set({image_url: response.artists.items[0].images[1].url});
            that.save();
            that.trigger('sync');
        }
      });
    }
  },

  getSmallImage: function () {
    var that = this;
    if (this.get('name')) {
      $.ajax({
        url: 'https://api.spotify.com/v1/search',
        data: {
            q: that.get('name'),
            type: 'artist'
        },
        success: function (response) {
            that.set({small_image_url: response.artists.items[0].images[2].url});
            that.save();
            that.trigger('sync');
        }
      });
    }
  },

  getDescription: function () {
    var that = this;
    if (this.get('name')) {
      $.ajax({
        url: 'http://developer.echonest.com/api/v4/artist/biographies?api_key=P5IRNLNKLZHCK9XQP&name='
        + that.get('name') +
        '&format=json&results=1&start=0&license=cc-by-sa',

        success: function (response) {
            that.set({description: response.response.biographies[0].text});
            that.save();
            that.trigger('sync');
        }
      });
    }


  }
});
