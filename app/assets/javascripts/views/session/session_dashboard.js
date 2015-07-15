Encore.Views.SessionDashboard = Backbone.View.extend({
  template: JST['session/dashboard'],

  render: function () {
    var content = this.template();
    this.$el.html(content);
    return this;
  }

})
