Encore.Views.SearchShow = Backbone.View.extend({
  template: JST['search/show'],

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);

    if (!this.collection.artists()){
      return this;
    }
    var that = this;
    var artists = this.model.artists();
    this.collection.artists().each( function (artist) {
      var view = new Encore.Views.SessionArtist({
        model: artist,
        collection: artists
      });
      that.$el.append(view.render().$el);
    });
    return this;
  }
});
