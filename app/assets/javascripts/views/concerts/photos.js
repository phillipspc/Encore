Encore.Views.ConcertPhotos = Backbone.View.extend({

  template: JST['concerts/photos'],

  render: function () {
    var content = this.template();
    this.$el.html(content);
    return this;
  }

})
