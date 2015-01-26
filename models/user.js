var bookshelf = require('./base')

var User = bookshelf.Model.extend({
  tableName: 'users',
  trips: function() {
    return this.belongsToMany(Trip);
  }
});

var Users = bookshelf.Collection.extend({
  model: User
});

module.exports = {
  User: User,
  Users: Users,
}

