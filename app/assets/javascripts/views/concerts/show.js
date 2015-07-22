Encore.Views.ConcertShow = Backbone.View.extend({
  template: JST['concerts/show'],

  events: {
    'click .track-concert': 'trackConcert',
    'click .untrack-concert': 'untrackConcert'
  },

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.model.artist(), 'sync', this.render)
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
