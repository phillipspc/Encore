Encore.Routers.Router = Backbone.Router.extend({

  initialize: function () {
    this.$rootEl = $('#main');
  },

  routes: {
    "": 'dashboard'
  },

  dashboard: function () {

  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
