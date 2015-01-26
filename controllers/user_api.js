var data = require('../models/user');

var controller = {};

controller.get_by_id = function(req, res, next) {
  data.User.forge({id: req.params.id})
    .fetch()
    .then(function(user) {
      if (user) {
      res.json({error: false,
        data: user.toJSON()
      });
      } else {
        res.status(500).json({error: true,
          data: 'Record not found'})
      }
    })
    .otherwise(function(error) {
      res.status(500).json({error: true,
        data: error.message
      });
    });
}

module.exports = controller;
