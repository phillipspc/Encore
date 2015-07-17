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

      var that = this;
      var locales = this.locales;
      locales.each( function (locale){
        locales.getOrFetch(locale.id);
        var view = new Encore.Views.SessionLocale({
          model: locale
        });
        that.$el.append(view.render().$el);
      });
      return this;
  }
});
