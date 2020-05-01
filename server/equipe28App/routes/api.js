var express = require('express');
var router = express.Router();

/* GET api listing. */
router.get('/', function(req, res, next) {
  res.send('API Oficial');
});


router.get('/users', function(req, res, next) {
  res.send('API users');
});

module.exports = router;
