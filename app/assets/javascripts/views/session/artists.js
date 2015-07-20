Encore.Views.SessionArtists = Backbone.View.extend({
  template: JST['session/artists'],

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);

    var that = this;
    var artists = this.model.artists();
    artists.each( function (artist) {
      var view = new Encore.Views.SessionArtist({
        model: artist,
        collection: artists
      });
      that.$el.append(view.render().$el);
    });
    return this;
  }
});
