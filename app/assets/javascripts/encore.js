window.Encore = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    Encore.current_user = new Encore.Models.CurrentUser();
    new Encore.Routers.Router({
      $rootEl: $('.main')
    });
    Backbone.history.start();
  }
};
