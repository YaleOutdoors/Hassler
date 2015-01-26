var trip = require('./trip');
var user = require('./user');
var _ = require('lodash');

var data = {}
data = _.merge(data, trip);
data = _.merge(data, user);

module.exports = data
