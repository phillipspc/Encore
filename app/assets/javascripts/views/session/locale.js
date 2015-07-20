Encore.Views.SessionLocale = Backbone.View.extend({
  template: JST['session/locale'],

  events: {
    'click .track-locale' : 'trackLocale',
    'click .untrack-locale' : 'untrackLocale'
  },

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  trackLocale: function () {
    event.preventDefault();
    this.model.track(this.collection);
  },

  untrackLocale: function () {
    event.preventDefault();
    this.model.untrack(this.collection);
  },

  render: function () {
    var ids = this.collection.pluck('id');
    var content = this.template({
      locale: this.model,
      ids: ids
    });
    this.$el.html(content);
    return this;
  }

});
