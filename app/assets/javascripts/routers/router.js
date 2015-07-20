Encore.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    window.current_user.fetch();
    this.artists = new Encore.Collections.Artists();
    this.artists.fetch();
    this.locales = new Encore.Collections.Locales();
    this.locales.fetch();
    this.concerts = new Encore.Collections.Concerts();
    this.concerts.fetch();
  },

  routes: {
    "": 'dashboard',
    "session/show": 'sessionShow',
    'session/locales': 'sessionLocales',
    'session/artists': 'sessionArtists',
    'session/plans': 'sessionPlans',
    'artists/:id': 'artistShow',
    'locales/:id': 'localeShow',
    'concerts/:id': 'concertShow'
  },

  dashboard: function () {
    var sessionDashboard = new Encore.Views.SessionDashboard({
      model: window.current_user,
      collection: window.current_user.trackedConcerts()
    });
    this._swapView(sessionDashboard);
  },

  sessionShow: function () {
    var sessionShow = new Encore.Views.SessionShow({
      model: window.current_user,
      collection: window.current_user.trackedConcerts()
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

  sessionPlans: function () {
    var sessionPlans = new Encore.Views.SessionPlans({
      model: window.current_user
    });
    this._swapView(sessionPlans);
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

  concertShow: function (id) {
    var concert = this.concerts.getOrFetch(id);
    var concertShow = new Encore.Views.ConcertShow({
      model: concert,
      collection: window.current_user.trackedConcerts()
    });
    this._swapView(concertShow);

  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
