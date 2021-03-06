Todos.TodosController = Ember.ArrayController.extend({
  actions: {
    clearCompleted: function() {
      console.log("clearCompleted");
      var completed = this.filterBy('isCompleted', true);
      completed.invoke('deleteRecord');
      completed.invoke('save');
    },
    createTodo: function () {
      // Get the todo title set by the "New Todo" text field
      var title = this.get('newTitle');
      if (!title.trim()) { return; }

      // Create the new Todo model
      var todo = this.store.createRecord('todo', {
        title: title,
        isCompleted: false
      });

      // Clear the "New Todo" text field
      this.set('newTitle', '');

      // Save the new model
      todo.save();
    }
  },
hasCompleted: function() {
  return this.get('completed') > 0;
}.property('completed'),

completed: function() {
  return this.filterBy('isCompleted', true).get('length');
}.property('@each.isCompleted'),
  remaining: function () {
    console.log("remaining " + this.filterBy('isCompleted', false).get('length'));
    return this.filterBy('isCompleted', false).get('length');
  }.property('@each.isCompleted'),

  inflection: function () {
  console.log("invflection");
    var remaining = this.get('remaining');
    return remaining === 1 ? 'item' : 'items';
  }.property('remaining')
});