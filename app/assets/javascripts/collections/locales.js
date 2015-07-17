Encore.Collections.Locales = Backbone.Collection.extend({
  url: '/api/locales',

  model: Encore.Models.Locale,

  getOrFetch: function (id) {
    var locale = this.get(id);
    var that = this;
    if (locale) {
      locale.fetch();
    } else {
      locale = new Encore.Models.Locale({ id: id });
      locale.fetch({
        success: function () {
          that.add(locale);
        }
      });
    }
    return locale;

  }

});
