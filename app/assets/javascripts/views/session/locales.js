Encore.Views.SessionLocales = Backbone.View.extend({
  template: JST['session/locales'],

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var content = this.template({
      locales: this.model.locales()
    });
    this.$el.html(content);

    var that = this;
    var locales = this.model.locales();
    locales.each( function (locale){
      var view = new Encore.Views.SessionLocale({
        model: locale,
        collection: locales
      });
      that.$el.append(view.render().$el);
    });
    return this;
  }
});
