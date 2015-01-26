var express = require('express');
var trips = require('../trips');
var router = express.Router();

/* GET trips listing. */
router.get('/', function(req, res, next) {
  res.json(trips.get_trip(req.query.id));
});

router.post('/new', function(req, res, next) {
  res.send('new request received');
});

router.put('/signup', function(req, res, next) {
  //trips.signup(req.query.id, current_user);
  res.send('signup request received');
});

module.exports = router;
