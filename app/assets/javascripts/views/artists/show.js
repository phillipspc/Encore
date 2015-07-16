Encore.Views.ArtistsShow = Backbone.View.extend({
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
    console.log('rendering');
    var ids = this.collection.pluck('id');
    var content = this.template({
      artist: this.model,
      ids: ids
    });
    this.$el.html(content);
    return this;
  },

  track: function (event) {
    event.preventDefault();
    this.model.track();
    this.model.fetch();
  },

  untrack: function (event) {
    event.preventDefault();
    this.model.untrack();
    this.model.fetch();
  }

});
