Encore.Views.SearchShow = Backbone.View.extend({
  template: JST['search/show'],

  events: {
    'click button.search': 'search'
  },

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
  },

  search: function () {
    event.preventDefault();
    var query = $('input.search').val();
    this.collection.fetch({
      data: {
				query: query
			}
    });
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);

    if (!this.collection.artists()){
      return this;
    }

    this.$('.results').empty();
    var that = this;
    var artists = this.model.artists();
    this.collection.artists().each( function (artist) {
      var view = new Encore.Views.SessionArtist({
        model: artist,
        collection: artists
      });
      that.$('.results').append(view.render().$el);

    });
    return this;
  }
});
