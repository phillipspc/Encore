Encore.Models.Artist = Backbone.Model.extend({
  urlRoot: '/api/artists',

  track: function () {
    var that = this;
    $.ajax({
      url: '/api/artists/' + that.id + '/artist_tracking',
      type: 'POST',
      success: function () {
        console.log('successful tracking');      }
    });
  },

  untrack: function () {
    var that = this;
    $.ajax({
      url: '/api/artists/' + that.id + '/artist_tracking',
      type: 'DELETE',
      success: function () {
        console.log('successful untracking');
      }
    });

  }
});
