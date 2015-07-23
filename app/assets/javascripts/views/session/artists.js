Encore.Views.SessionArtists = Backbone.View.extend({
  template: JST['session/artists'],

  events: {
    'keyup input.search': 'search'
  },

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
  },

  search: function (event) {
    event.preventDefault();
    $('.session-artist').html('');
    var query = $(event.currentTarget).val();
    this.searchResults = new Encore.Collections.SearchResults();
    this.searchResults.fetch({
      data: {
        query: query
      }
    });
    var searchShow = new Encore.Views.SearchShow({
      model: Encore.current_user,
      collection: this.searchResults
    });
    this._swapView(searchShow);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    var $subView = $('.session-artist');
    $subView.append(view.render().$el);
  }
});
