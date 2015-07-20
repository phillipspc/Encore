Encore.Views.SessionDashboard = Backbone.View.extend({
  template: JST['session/dashboard'],

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var numLocaleConcerts = this.model.localeConcerts().length;
    var content = this.template({
      numLocaleConcerts: numLocaleConcerts
    });
    this.$el.html(content);

    var that = this;
    this.model.localeConcerts().each( function(concert) {
      var view = new Encore.Views.SessionConcert({
        model: concert,
        collection: that.model.trackedConcerts()
      });
      that.$el.append(view.render().$el);
    });
    return this;
  }

})
