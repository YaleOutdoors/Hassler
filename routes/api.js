var trip_api = require('../controllers/trip_api');
var user_api = require('../controllers/user_api');
var express = require('express');
var router = express.Router();

// Home page
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

/* Trips */
//router.get('/trips', trip_api.index);

router.get('/trip/:id', trip_api.get_by_id);

//router.post('/trip/new', trip_api.create);

//router.put('/trip/:id/signup', trip_api.signup);

router.get('/user/:id', user_api.get_by_id);

module.exports = router;
