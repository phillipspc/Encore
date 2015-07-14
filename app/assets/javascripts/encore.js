window.Encore = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new Encore.Routers.Router;
    Backbone.history.start();
  }
};

$(document).ready(function(){
  Encore.initialize();
});
