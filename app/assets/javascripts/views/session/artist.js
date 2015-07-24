Encore.Views.SessionArtist = Backbone.View.extend({

  tagName: 'ul',
  className: 'session-artist',

  template: JST['session/artist'],

  events: {
    'click .track-artist': 'trackArtist',
    'click .untrack-artist': 'untrackArtist'
  },

  initialize: function () {
    this.model.fetch();
    this.listenTo(this.model, 'sync', this.render)
  },

  trackArtist: function (event) {
    event.preventDefault();
    this.model.track(this.collection);
  },

  untrackArtist: function (event) {
    event.preventDefault();
    this.model.untrack(this.collection);
  },

  render: function () {
    if (!this.model.concerts()){
      return this;
    }
    if (!this.model.get('small_image_url')) {
      this.model.getSmallImage();
      return this;
    }
    var content = this.template({
      artist: this.model,
      ids: this.collection.pluck('id')
    });
    this.$el.html(content);
    return this;
  }
});
