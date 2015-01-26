var data = require('../models');
var base = require('./base_api');

var controller = {};

controller.by_id = function(req, res, next) {
  var trip = data.Trip.forge({id: req.params.id});
  base.resolve(res, trip);
};

controller.all = function(req, res, next) {
  var trips = data.Trips.forge();
  base.resolve(res, trips);
};

controller.get_users_for_trip = function(req, res, next) {
  var users = data.Users.forge({trip_id: req.params.id});
  base.resolve(res, users);
};

module.exports = controller;




