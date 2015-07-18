Encore.Views.ArtistShowConcert = Backbone.View.extend({

  template: JST['artists/show_concert'],

  events: {
    'click .track-concert': 'trackConcert',
    'click .untrack-concert': 'untrackConcert'
  },

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function () {
    var ids = this.collection.pluck('id');
    var locale = this.model.locale();
    var content = this.template({
      concert: this.model,
      locale: locale,
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
