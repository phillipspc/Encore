Encore.Collections.Artists = Backbone.Collection.extend({
  url: '/api/artists',

  model: Encore.Models.Artst,

  getOrFetch: function (id) {
    var artist = this.get(id);
    var that = this;
    if (artist) {
      artist.fetch();
    } else {
      artist = new Encore.Models.Artist({ id: id });
      artist.fetch({
        success: function () {
          that.add(artist);
        }
      });
    }
    return artist;

  }
});
