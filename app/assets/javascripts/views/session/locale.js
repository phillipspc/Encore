Encore.Views.SessionLocale = Backbone.View.extend({
  template: JST['session/locale'],

  render: function () {
    var content = this.template({
      locale: this.model
    });
    this.$el.html(content);
    return this;
  }

});
