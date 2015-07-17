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
  },

  track: function (collection) {
    var that = this;
    $.ajax({
      url: '/api/locales/' + that.id + '/user_locale',
      type: 'POST',
      success: function () {
        collection.add(that);
        that.trigger('sync');
      }
    });

  },

  untrack: function (collection) {
    var that = this;
    $.ajax({
      url: '/api/locales/' + that.id + '/user_locale',
      type: 'DELETE',
      success: function () {
        collection.remove(that);
        that.trigger('sync');
      }
    });

  }

});
