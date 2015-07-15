Encore.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    window.current_user.fetch();
  },

  routes: {
    "": 'dashboard',
    "session/show": 'show'
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

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
