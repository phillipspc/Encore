Encore.Collections.LocaleSearchResults = Backbone.Collection.extend({
  url: 'api/locale_search',

  locales: function () {
    if (!this._locales) {
      this._locales = new Encore.Collections.Locales();
    }
    return this._locales;
  },

  parse: function (response) {
    if (response.locales) {
      this.locales().set(response.locales, { parse: true });
      delete response.locales;
    }
    return response;
  }

});
