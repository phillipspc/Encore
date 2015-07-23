Encore.Views.ConcertShow = Backbone.View.extend({

  // model: concert   collection: conert.photos()
  template: JST['concerts/show'],

  events: {
    'click .track-concert': 'trackConcert',
    'click .untrack-concert': 'untrackConcert'
  },

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.model.artist(), 'sync', this.render);

  },

  render: function () {
    if (!this.model.artist().get('image_url')){
      this.model.artist().getLargeImage();
      return this;
    }
    var ids = this.collection.pluck('id');
    var content = this.template({
      concert: this.model,
      ids: ids
    });
    this.$el.html(content);

    var concertPhotos = new Encore.Views.ConcertPhotos({
      model: this.model,
      collection: this.model.photos()
    });
    this.$el.append(concertPhotos.render().$el)
    return this;
  },

  trackConcert: function (event) {
    event.preventDefault();
    this.model.track(this.collection);
  },

  untrackConcert: function (event) {
    event.preventDefault();
    this.model.untrack(this.collection);
  }
})
