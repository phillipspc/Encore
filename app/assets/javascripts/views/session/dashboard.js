Encore.Views.SessionDashboard = Backbone.View.extend({
  template: JST['session/dashboard'],

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);

    var that = this;
    var concerts = window.current_user.trackedConcerts();
    this.model.localeConcerts().each( function(concert) {
      that.model.localeConcerts().getOrFetch(concert.id);
      var view = new Encore.Views.DashboardConcert({
        model: concert,
        collection: concerts
      });
      that.$el.append(view.render().$el);
    });
    return this;
  }

})
