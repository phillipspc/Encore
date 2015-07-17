Encore.Models.Concert = Backbone.Model.extend({
  urlRoot: '/api/concerts',

  locale: function () {
    if (!this._locale){
      this._locale = new Encore.Models.Locale();
    }
    return this._locale;
  },


  parse: function (response) {
    if (response.locale) {
      this.locale().set(response.locale);
      delete response.locale;
    }
    return response;
  }

})
