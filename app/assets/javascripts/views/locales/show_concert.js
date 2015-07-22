Encore.Views.LocaleShowConcert = Backbone.View.extend({
  template: JST['locales/show_concert'],

  events: {
    'click .track-concert': 'trackConcert',
    'click .untrack-concert': 'untrackConcert'
  },

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function () {
    if (!this.model.get('small_image_url')) {
      this.model.getSmallImage();
      return this;
    }
    
    var ids = this.collection.pluck('id');
    var artist = this.model.artist();
    var content = this.template({
      concert: this.model,
      artist: artist,
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
});
