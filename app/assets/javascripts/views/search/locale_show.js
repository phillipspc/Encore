Encore.Views.LocaleSearchShow = Backbone.View.extend({
  template: JST['search/locale_show'],

  events: {
    'submit': 'search'
  },

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
  },

  search: function () {
    event.preventDefault();
    var query = $('input.search').val();
    this.collection.fetch({
      data: {
				query: query
			}
    });
  },

  render: function () {
    var content = this.template({
      results: this.collection.locales()
    });
    this.$el.html(content);

    if (!this.collection.locales()){
      return this;
    }

    this.$('.results').empty();
    var that = this;
    var locales = this.model.locales();
    this.collection.locales().each( function (locale) {
      var view = new Encore.Views.SessionLocale({
        model: locale,
        collection: locales
      });
      that.$('.results').append(view.render().$el);

    });
    return this;
  }
});
