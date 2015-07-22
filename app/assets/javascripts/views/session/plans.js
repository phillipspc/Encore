Encore.Views.SessionPlans = Backbone.View.extend({
  template: JST['session/plans'],

  initialize: function () {
    this.model.fetch();
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);

    if (!this.model.trackedConcerts()){
      return this;
    }
    var that = this;
    var concerts = this.model.trackedConcerts();
    concerts.each( function (concert) {
      var view = new Encore.Views.SessionConcert({
        model: concert,
        collection: concerts
      });
      that.$el.append(view.render().$el);
    });
    return this;

  }

});
