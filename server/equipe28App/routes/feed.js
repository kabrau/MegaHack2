var express = require('express');
var router = express.Router();

/* GET feed listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a feed resource');
});

module.exports = router;