Encore.Views.ConcertPhotoNew = Backbone.View.extend({

  // model: new ConcertPhoto({ concert_id: id })
  // collection: concert.photos();

  template: JST['concerts/photo_new'],

  className: 'photo-upload group',

  events: {
    'submit': 'submit',
    "change #input-concert-photo": "fileInputChange",
    'click .cancel': 'cancel'
  },

  initialize: function(){
  },

  render: function(){
    var concert_id = this.model.get('concert_id');
    var html = this.template({
      concert_id: concert_id
    });

    this.$el.html(html);
    return this;
  },

  submit: function(event){
    event.preventDefault();
    var file = this.$("#input-concert-photo")[0].files[0];

    var formData = new FormData();
    var concert_id = this.model.get('concert_id');
    formData.append("concert_photo[photo]", file);
    formData.append('concert_photo[concert_id]', concert_id);
    var that = this;
    this.model.saveFormData(formData, {
      success: function() {
        that.collection.add(that.model);
        Backbone.history.navigate("#/concerts/" + concert_id, { trigger: true });
      }
    });
  },

  fileInputChange: function(event){
    console.log(event.currentTarget.files[0]);

    var that = this;
    var file = event.currentTarget.files[0];
    var reader = new FileReader();

    reader.onloadend = function(){
      that._updatePreview(reader.result);
    }

    if (file) {
      reader.readAsDataURL(file);
    } else {
      that._updatePreview("");
    }
  },

  _updatePreview: function(src){
    this.$el.find("#preview-concert-photo").attr("src", src);
  },


  cancel: function (event) {
    event.preventDefault();
    var concert_id = this.model.get('concert_id');
    Backbone.history.navigate("#/concerts/" + concert_id, { trigger: true });
  }

});
