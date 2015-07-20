Encore.Views.SessionConcert = Backbone.View.extend({
  tagName: 'ul',
  className: 'concert group',

  template: JST['session/concert'],

  events: {
    'click .track-concert': 'trackConcert',
    'click .untrack-concert': 'untrackConcert'
  },

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
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
