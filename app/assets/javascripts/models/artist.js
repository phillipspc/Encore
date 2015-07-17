Encore.Models.Artist = Backbone.Model.extend({
  urlRoot: '/api/artists',

  events: function () {
    if (!this._events) {
      this._events = new Encore.Collections.Events();
    }
    return this._events;
  },

  parse: function (response) {
    if (response.events) {
      this.events().set(response.events);
      delete response.events;
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

  }
});
