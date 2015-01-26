var data = require('../models');
var base = require('./base_api');

var controller = {};

controller.get_by_id = function(req, res, next) {
  var user = data.User.forge({id: req.params.id})
  base.resolve(res, user);
}

module.exports = controller;
