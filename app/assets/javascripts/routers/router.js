Encore.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    window.current_user.fetch();
    this.artists = new Encore.Collections.Artists();
    this.artists.fetch();
  },

  routes: {
    "": 'dashboard',
    "session/show": 'sessionShow',
    'session/locales': 'sessionLocales',
    'session/artists': 'sessionArtists',
    'artists/:id': 'artistsShow'
  },

  dashboard: function () {
    var sessionDashboard = new Encore.Views.SessionDashboard({
      model: window.current_user
    });
    this._swapView(sessionDashboard);
  },

  sessionShow: function () {
    var sessionShow = new Encore.Views.SessionShow({
      model: window.current_user
    });
    this._swapView(sessionShow);
  },

  sessionLocales: function () {
    var sessionLocales = new Encore.Views.SessionLocales({
      model: window.current_user
    });
    this._swapView(sessionLocales);
  },

  sessionArtists: function () {
    var sessionArtists = new Encore.Views.SessionArtists({
      model: window.current_user
    });
    this._swapView(sessionArtists);

  },

  artistsShow: function (id) {
    var artist = this.artists.getOrFetch(id);
    var artistsShow = new Encore.Views.ArtistsShow({
      model: artist,
      collection: window.current_user.artists()
    });
    this._swapView(artistsShow);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
