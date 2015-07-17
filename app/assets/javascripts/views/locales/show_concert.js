Encore.Views.LocaleShowConcert = Backbone.View.extend({
  template: JST['locales/show_concert'],

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render)
  },

  render: function () {
    var artist = this.model.artist();
    var content = this.template({
      concert: this.model,
      artist: artist
    });
    this.$el.html(content);
    return this;
  }

});
