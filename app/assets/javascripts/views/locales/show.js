Encore.Views.LocaleShow = Backbone.View.extend({

  template: JST['locales/show'],

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render)
  },

  render: function () {
    var content = this.template({
      locale: this.model
    });
    this.$el.html(content);
    return this;
  }

});
