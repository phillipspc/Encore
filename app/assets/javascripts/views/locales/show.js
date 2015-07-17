Encore.Views.LocaleShow = Backbone.View.extend({

  template: JST['locales/show'],

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render)
  },

  render: function () {
    var ids = this.collection.pluck('id');
    var content = this.template({
      locale: this.model,
      ids: ids
    });
    this.$el.html(content);
    return this;
  }

});
