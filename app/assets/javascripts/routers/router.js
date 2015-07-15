Encore.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "": 'show'
  },

  show: function () {
    window.current_user.fetch();
    var sessionShow = new Encore.Views.SessionShow({
      model: window.current_user
    });
    this._swapView(sessionShow);
  },

  dashboard: function () {
    var dashboardView = new Encore.Views.UsersDashboard();
    this._swapView(dashboardView);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
