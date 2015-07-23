Encore.Views.ConcertPhotos = Backbone.View.extend({

  // model: concert   collection: conert.photos()

  template: JST['concerts/photos'],

  events: {
    'click .upload-photo': 'renderUploader'
  },

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render)
  },

  render: function () {
    var content = this.template({
      id: this.model.id,
      photos: this.model.photos()
    });
    this.$el.html(content);
    return this;
  },

  renderUploader: function (event) {
    event.preventDefault();
    var uploadView = new Encore.Views.ConcertPhotoNew({
      model: new Encore.Models.ConcertPhoto({ concert_id: this.model.id }),
      collection: this.model.photos()
    });
    $('.uploader-view').html(uploadView.render().$el);
  }

})
