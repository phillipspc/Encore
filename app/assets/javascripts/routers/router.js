Encore.Routers.Router = Backbone.Router.extend({

  initialize: function () {
    this.$rootEl = $('#main');
  },

  routes: {
    "": 'dashboard'
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
