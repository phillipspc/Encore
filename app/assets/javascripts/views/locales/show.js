Encore.Views.LocaleShow = Backbone.View.extend({
  template: JST['locales/show'],

  events: {
    'click .track-locale': 'trackLocale',
    'click .untrack-locale': 'untrackLocale'
  },

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    if (!this.model.escape('city')) {
      return this;
    }
    var ids = this.collection.pluck('id');
    var content = this.template({
      locale: this.model,
      ids: ids
    });
    this.$el.html(content);

    var that = this;
    var concerts = this.model.concerts();
    concerts.each( function (concert) {
      var view = new Encore.Views.LocaleShowConcert({
        model: concert,
        collection: Encore.current_user.trackedConcerts()
      });
      that.$el.append(view.render().$el);
    });
    return this;
  },

  trackLocale: function () {
    event.preventDefault();
    this.model.track(this.collection);
  },

  untrackLocale: function () {
    event.preventDefault();
    this.model.untrack(this.collection);
  }

});
