Encore.Views.SessionConcert = Backbone.View.extend({

  // this.collection should be trackedConcerts.

  tagName: 'ul',
  className: 'session-concert',

  template: JST['session/concert'],

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
    if (!this.model.locale().escape('city')) {
      return this;
    }
    var content = this.template({
      concert: this.model,
      ids: this.collection.pluck('id')
    });
    this.$el.html(content);
    return this;
  }
});
