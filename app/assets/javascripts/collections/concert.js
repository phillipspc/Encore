Encore.Collections.Concerts = Backbone.Collection.extend({
  url: '/api/concerts',
  model: Encore.Models.Concert,

  initialize: function (models, options) {
    // this.locale = options.locale;
    // 
  },

  comparator: 'date',

  getOrFetch: function (id) {
    var concert = this.get(id);
    var that = this;
    if (concert) {
      concert.fetch();
    } else {
      concert = new Encore.Models.Concert({ id: id });
      concert.fetch({
        success: function () {
          that.add(concert);
        }
      });
    }
    return concert;

  }

});
