// seed script
var data = require('./models')
var _ = require('lodash');
var sequence = require('when/sequence');
var names = ['Miela Mayer', 'Eugene Lim', 'Rachel Strodel', 'Marcus Russi',
    'Sylvan Zheng', 'Elena Hodges', 'Rafi Bildner'];

var name_to_email = function(name) {
  return name + '@yale.edu';
}

var random_netid = function(name) {
  return name.substring(0,3) + Math.floor(Math.random() * 100);
}

var createUser = function(name) {
  return data.User.forge({
    name: name,
    email: name_to_email(name),
    username: random_netid(name)
  }).save();
};

var createUsers = function() {
  var users = [];
  users = _.map(names, function(name) {
    return function() {
      return createUser(name);
    };
  });
  return sequence(users);
}

createUsers().then(function() {
  console.log('Users created');
  process.exit(0);
}).otherwise(function (error) {
  throw error;
});

// seed trips

