//= require handlebars
//= require ember
//= require ember-data
//= require myapp
//= require_tree ./models
//= require_tree ./controllers
//= require_tree ./views
//= require_tree ./helpers
//= require_tree ./components
//= require_tree ./templates
//= require_tree ./routes
//= require_self


//Myapp.ApplicationAdapter = DS.FixtureAdapter.extend();

window.Todos = Ember.Application.create();

Todos.ApplicationAdapter = DS.FixtureAdapter.extend();
