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
      this.concerts().set(response.concerts);
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
        console.log('successfully tracked an artist');
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
        console.log('successfully untracked an artist');
        collection.remove(that);
        that.trigger('sync');
      }
    });

  }
});
