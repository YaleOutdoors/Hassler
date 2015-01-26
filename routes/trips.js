var express = require('express');
var data = require('../models/trip');
var router = express.Router();

/* GET trips listing. */
router.get('/', function(req, res, next) {
});

router.get('/:id', function(req, res, next) {
  data.Trip.forge({id: req.params.id})
    .fetch()
    .then(function(trip) {
      res.json({error: false,
                data: trip.toJSON()
      });
    })
    .otherwise(function(error) {
      res.status(500).json({error: true,
                            data: error.message
      });
    });

});

router.post('/new', function(req, res, next) {
  res.send('new request received');
});

router.put('/signup', function(req, res, next) {
  //trips.signup(req.query.id, current_user);
  res.send('signup request received');
});

module.exports = router;
