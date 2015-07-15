Encore.Models.CurrentUser = Backbone.Model.extend({
  urlRoot: '/api/session',

  locations: function () {
    if (!this._locations) {
      this._locations = new Encore.Collections.Locations([], {user: this});
    }
    return this._locations;
  },

  parse: function (response) {
    if (response.locations) {
      this.locations().set(response.locations);
      delete response.locations;
    }
    return response;
  }
});
