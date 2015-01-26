var bookshelf = require('./base');

var Trip = bookshelf.Model.extend({
  tableName: 'trips',
  users: function() {
    return this.belongsToMany(User);
  }
});

var Trips = bookshelf.Collection.extend({
  model: Trip
});

module.exports = {
  Trip: Trip,
  Trips: Trips,
}
