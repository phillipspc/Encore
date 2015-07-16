Encore.Views.ArtistsShow = Backbone.View.extend({
  template: JST['artists/show'],

  events: {
    'click .track': 'track'
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
    return this;
  },

  track: function (event) {
    event.preventDefault();
    this.model.save({},{
      url: '/api/artists/' + this.model.id + '/edit'
    });
  }

});
