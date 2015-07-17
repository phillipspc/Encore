Encore.Views.SessionLocales = Backbone.View.extend({
  template: JST['session/locales'],

  initialize: function () {
    this.locales = this.model.locales();
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
      var content = this.template({
        locales: this.locales
      });
      this.$el.html(content);
      return this;
  }
});
