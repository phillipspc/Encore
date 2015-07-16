Encore.Models.Artist = Backbone.Model.extend({
  urlRoot: '/api/artists',

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
