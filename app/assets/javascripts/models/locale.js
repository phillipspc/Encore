Encore.Models.Locale = Backbone.Model.extend({
  urlRoot: '/api/locales',

  concerts: function () {
    if (!this._concerts) {
      this._concerts = new Encore.Collections.Concerts();
    }
    return this._concerts;
  },

  parse: function (response) {
    if (response.concerts) {
      this.concerts().set(response.concerts);
      delete response.concerts;
    }
    return response;
  }

});
