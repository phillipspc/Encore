Encore.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    window.current_user.fetch();
    this.artists = new Encore.Collections.Artists();
    this.artists.fetch();
    this.locales = new Encore.Collections.Locales();
    this.locales.fetch();
  },

  routes: {
    "": 'dashboard',
    "session/show": 'sessionShow',
    'session/locales': 'sessionLocales',
    'session/artists': 'sessionArtists',
    'artists/:id': 'artistShow',
    'locales/:id': 'localeShow'
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

  artistShow: function (id) {
    var artist = this.artists.getOrFetch(id);
    var artistShow = new Encore.Views.ArtistShow({
      model: artist,
      collection: window.current_user.artists()
    });
    this._swapView(artistShow);
  },

  localeShow: function (id) {
    var locale = this.locales.getOrFetch(id);
    var localeShow = new Encore.Views.LocaleShow({
      model: locale,
      collection: window.current_user.locales()
    });
    this._swapView(localeShow);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
