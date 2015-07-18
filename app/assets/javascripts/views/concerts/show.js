Encore.Views.ConcertShow = Backbone.View.extend({
  template: JST['concerts/show'],

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var ids = this.collection.pluck('id');
    var content = this.template({
      concert: this.model,
      ids: ids
    });
    this.$el.html(content);
    return this;
  }
})
