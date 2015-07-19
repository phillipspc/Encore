Encore.Views.SessionLocales = Backbone.View.extend({
  template: JST['session/locales'],

  events: {
    'click .untrack-locale': 'untrack'
  },

  initialize: function () {
    var locales = this.model.locales();
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(locales, 'remove', this.render)
  },

  untrack: function (event) {
    event.preventDefault();
    $target = $(event.currentTarget);
    var locales = this.model.locales();
    var locale = locales.get($target.attr('data-id'));
    locale.untrack(locales);
  },

  render: function () {
    var locales = this.model.locales();
    var content = this.template({
      locales: locales
    });
    this.$el.html(content);

    var that = this;
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
