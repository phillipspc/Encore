Encore.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    Encore.current_user.fetch();
    Encore.artists = new Encore.Collections.Artists();
    Encore.locales = new Encore.Collections.Locales();
    Encore.concerts = new Encore.Collections.Concerts();
  },

  routes: {
    "": 'dashboard',
    "session/show": 'sessionShow',
    'session/locales': 'sessionLocales',
    'session/artists': 'sessionArtists',
    'session/plans': 'sessionPlans',
    'artists/:id': 'artistShow',
    'locales/:id': 'localeShow',
    'concerts/:id': 'concertShow',
    'search/:query': 'search'
  },

  dashboard: function () {
    var sessionDashboard = new Encore.Views.SessionDashboard({
      model: Encore.current_user,
      collection: Encore.current_user.localeConcerts()
    });
    this._swapView(sessionDashboard);
  },

  sessionShow: function () {
    var sessionShow = new Encore.Views.SessionShow({
      model: Encore.current_user,
      collection: Encore.current_user.trackedConcerts()
    });
    this._swapView(sessionShow);
    $.rails.refreshCSRFTokens();
  },

  sessionLocales: function () {
    var sessionLocales = new Encore.Views.SessionLocales({
      model: Encore.current_user
    });
    this._swapView(sessionLocales);
  },

  sessionArtists: function () {
    var sessionArtists = new Encore.Views.SessionArtists({
      model: Encore.current_user
    });
    this._swapView(sessionArtists);

  },

  sessionPlans: function () {
    var sessionPlans = new Encore.Views.SessionPlans({
      model: Encore.current_user
    });
    this._swapView(sessionPlans);
  },

  artistShow: function (id) {
    var artist = Encore.artists.getOrFetch(id);
    var artistShow = new Encore.Views.ArtistShow({
      model: artist,
      collection: Encore.current_user.artists()
    });
    this._swapView(artistShow);
  },

  localeShow: function (id) {
    var locale = Encore.locales.getOrFetch(id);
    var localeShow = new Encore.Views.LocaleShow({
      model: locale,
      collection: Encore.current_user.locales()
    });
    this._swapView(localeShow);
  },

  concertShow: function (id) {
    var concert = Encore.concerts.getOrFetch(id);
    var concertShow = new Encore.Views.ConcertShow({
      model: concert,
      collection: Encore.current_user.trackedConcerts()
    });
    this._swapView(concertShow);

  },

  search: function (query) {
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
    this.$rootEl.html(view.render().$el);
  }

});
