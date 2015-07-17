Encore.Views.SessionArtists = Backbone.View.extend({
  template: JST['session/artists'],

  events: {
    'click .untrack': 'untrack'
  },

  initialize: function () {
    var artists = this.model.artists();
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(artists, 'sync remove', this.render);
  },

  untrack: function (event) {
    event.preventDefault();
    $target = $(event.currentTarget);
    var artists = this.model.artists();
    var artist = artists.get($target.attr('data-id'));
    artist.untrack(artists);
  },

  render: function () {
    var content = this.template({
      user: this.model
    });
    this.$el.html(content);
    return this;
  }
});
