Encore.Views.SessionShow = Backbone.View.extend({
  template: JST['session/show'],

  events: {
    'click button': 'signOut'
  },

  initialize: function () {
    this.model.fetch();
    this.listenTo(this.model, 'sync', this.render)
  },

  render: function () {
    var content = this.template({
      user: this.model
    });
    this.$el.html(content);
    return this;
  },

  signOut: function (event) {
    event.preventDefault();
    this.model.signOut();
  }
});
