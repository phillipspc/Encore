Encore.Views.SessionLocales = Backbone.View.extend({
  template: JST['session/locales'],

  events: {
    'submit': 'search'
  },

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var locales = this.model.locales();
    var content = this.template({
      locales: locales
    });
    this.$el.html(content);

    var that = this;
    locales.each( function (locale){
      locale = Encore.locales.getOrFetch(locale.id);
      var view = new Encore.Views.SessionLocale({
        model: locale,
        collection: locales
      });
      that.$el.append(view.render().$el);
    });
    return this;
  },

  search: function (event) {
    event.preventDefault();
    var query = $('input.search').val();
    Backbone.history.navigate('locale_search/' + query, {trigger: true})
  }
});
