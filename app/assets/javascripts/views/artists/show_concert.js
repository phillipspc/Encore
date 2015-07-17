Encore.Views.ArtistShowConcert = Backbone.View.extend({

  template: JST['artists/show_concert'],

  initialize: function () {
  },

  render: function () {
    var content = this.template({});
    this.$el.html(content);
    return this;
  }

});
