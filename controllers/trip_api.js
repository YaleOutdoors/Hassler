var data = require('../models');

var controller = {};

controller.get_by_id = function(req, res, next) {
  data.Trip.forge({id: req.params.id})
    .fetch()
    .then(function(trip) {
      if (trip) {
        res.json({error: false,
                  data: trip.toJSON()
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
};

module.exports = controller;




