Encore.Views.ArtistShowConcert = Backbone.View.extend({

  template: JST['artists/show_concert'],

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var locale = this.model.locale();
    var content = this.template({
      concert: this.model,
      locale: locale
    });
    this.$el.html(content);
    return this;
  }

});
