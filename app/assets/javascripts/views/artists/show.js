Encore.Views.ArtistShow = Backbone.View.extend({
  template: JST['artists/show'],

  events: {
    'click .track': 'track',
    'click .untrack': 'untrack'
  },

  initialize: function (){
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function () {
    var ids = this.collection.pluck('id');
    var content = this.template({
      artist: this.model,
      ids: ids
    });
    this.$el.html(content);

    var that = this;
    var concerts = this.model.concerts();
    concerts.each( function (concert) {
      concerts.getOrFetch(concert.id);
      var view = new Encore.Views.ArtistShowConcert({
        model: concert,
        collection: window.current_user.concerts()
      });
      that.$el.append(view.render().$el);
    });
    return this;
  },

  track: function (event) {
    event.preventDefault();
    this.model.track(this.collection);
  },

  untrack: function (event) {
    event.preventDefault();
    this.model.untrack(this.collection);
  }

});
