Encore.Views.SessionArtists = Backbone.View.extend({
  template: JST['session/artists'],

  events: {
    'click button.search': 'search'
  },

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var artists = this.model.artists();
    var content = this.template({
      artists: artists
    });
    this.$el.html(content);

    var that = this;
    artists.each( function (artist) {
      var view = new Encore.Views.SessionArtist({
        model: artist,
        collection: artists
      });
      that.$el.append(view.render().$el);
    });
    return this;
  },

  search: function (event) {
    event.preventDefault();
    var query = $('input.search').val();
    Backbone.history.navigate('search/' + query, {trigger: true})
  }

});
