Encore.Models.Artist = Backbone.Model.extend({
  urlRoot: '/api/artists'


  // urlRoot: function () {
  //   var id = this.model.id;
  //   var route = '/api/artists/';
  //   debugger
  //   return route.concat(id);
  // }

});
