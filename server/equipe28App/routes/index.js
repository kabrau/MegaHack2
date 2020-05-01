var express = require('express');
var router = express.Router();

//script(src='/reload/reload.js')

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express 1.10' });
});

module.exports = router;
