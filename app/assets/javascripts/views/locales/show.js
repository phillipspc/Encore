Encore.Views.LocaleShow = Backbone.View.extend({

  template: JST['locales/show'],

  render: function () {
    var content = this.template({
      locale: this.model
    });
    this.$el.html(content);
    return this;
  }

});
