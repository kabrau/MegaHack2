var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function (req, res, next) {

    
  var today =  new Date()

  res.render('index', { 
    title: 'Express 1.10 '+today
  });
});

module.exports = router;
