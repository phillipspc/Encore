Encore.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    window.current_user.fetch();
  },

  routes: {
    "": 'dashboard',
    "session/show": 'show',
    'session/locations': 'locations',
    'session/artists': 'artists'
  },

  show: function () {
    var sessionShow = new Encore.Views.SessionShow({
      model: window.current_user
    });
    this._swapView(sessionShow);
  },

  dashboard: function () {
    var sessionDashboard = new Encore.Views.SessionDashboard({
      model: window.current_user
    });
    this._swapView(sessionDashboard);
  },

  locations: function () {
    var sessionLocations = new Encore.Views.SessionLocations({
      model: window.current_user
    });
    this._swapView(sessionLocations);
  },

  artists: function () {
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
