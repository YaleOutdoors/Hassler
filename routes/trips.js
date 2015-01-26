var express = require('express');
var trips = require('../trips');
var router = express.Router();

/* GET trips listing. */
router.get('/', function(req, res, next) {
  res.json(trips.get_trip(req.query.id));
});


module.exports = router;
