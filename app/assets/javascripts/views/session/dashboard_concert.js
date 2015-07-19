Encore.Views.DashboardConcert = Backbone.View.extend({
  template: JST['locales/show_concert'],

  events: {
    'click .track-concert': 'trackConcert',
    'click .untrack-concert': 'untrackConcert'
  },

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.collection, 'sync', this.render);
  },

  trackConcert: function (event) {
    event.preventDefault();
    this.model.track(this.collection);
  },

  untrackConcert: function (event) {
    event.preventDefault();
    this.model.untrack(this.collection);
  },

  render: function () {
    var content = this.template({
      concert: this.model,
      artist: this.model.artist(),
      locale: this.model.locale(),
      ids: this.collection.pluck('id')
    });
    this.$el.html(content);
    return this;
  }
});
