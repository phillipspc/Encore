Encore.Views.SessionLocale = Backbone.View.extend({
  template: JST['session/locale'],

  tagname: 'ul',

  events: {
    'click .track-locale' : 'trackLocale',
    'click .untrack-locale' : 'untrackLocale'
  },

  initialize: function () {
    // this.model.fetch();
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
    if (!this.model.concerts()){
      return this;
    }
    var ids = this.collection.pluck('id');
    var content = this.template({
      locale: this.model,
      ids: ids
    });
    this.$el.html(content);
    return this;
  }

});
