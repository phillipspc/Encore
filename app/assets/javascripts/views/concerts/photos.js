Encore.Views.ConcertPhotos = Backbone.View.extend({

  template: JST['concerts/photos'],

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render)
  },

  render: function () {
    var content = this.template({
      photos: this.model.photos()
    });
    this.$el.html(content);
    return this;
  }

})
