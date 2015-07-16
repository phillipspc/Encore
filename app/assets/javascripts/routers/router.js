Encore.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    window.current_user.fetch();
    this.artists = new Encore.Collections.Artists();
  },

  routes: {
    "": 'dashboard',
    "session/show": 'sessionShow',
    'session/locations': 'sessionLocations',
    'session/artists': 'sessionArtists'
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

  sessionLocations: function () {
    var sessionLocations = new Encore.Views.SessionLocations({
      model: window.current_user
    });
    this._swapView(sessionLocations);
  },

  sessionArtists: function () {
    var sessionArtists = new Encore.Views.SessionArtists({
      model: window.current_user
    });
    this._swapView(sessionArtists);

  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
