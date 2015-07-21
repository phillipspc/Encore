Encore.Views.SessionDashboard = Backbone.View.extend({
  template: JST['session/dashboard'],

  initialize: function () {
    this.model.fetch();
    this.listenTo(this.model, 'sync', this.render);
    // this.listenTo(this.collection, 'sync', this.render);
  },

  render: function () {
    var content = this.template({
      numLocaleConcerts: this.collection.length
    });
    this.$el.html(content);

    var that = this;
    if (this.collection.length > 0) {
      debugger
    }
    this.collection.each( function(concert) {
      var view = new Encore.Views.SessionConcert({
        model: concert,
        collection: that.model.trackedConcerts()
      });
      that.$el.append(view.render().$el);
    });
    return this;
  }

})
