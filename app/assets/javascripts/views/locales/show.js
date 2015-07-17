Encore.Views.LocaleShow = Backbone.View.extend({

  template: JST['locales/show'],

  events: {
    'click .track': 'track',
    'click .untrack': 'untrack'
  },

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function () {
    var ids = this.collection.pluck('id');
    var content = this.template({
      locale: this.model,
      ids: ids
    });
    this.$el.html(content);
    return this;
  },

  track: function () {
    event.preventDefault();
    this.model.track(this.collection);
  },

  untrack: function () {
    event.preventDefault();
    this.model.untrack(this.collection);
  }

});
