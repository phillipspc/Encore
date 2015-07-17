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

    var that = this;
    var concerts = this.model.concerts();
    concerts.each( function (concert) {
      concerts.getOrFetch(concert.id);
      var view = new Encore.Views.LocaleShowConcert({
        model: concert
      });
      that.$el.append(view.render().$el);
    });
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
