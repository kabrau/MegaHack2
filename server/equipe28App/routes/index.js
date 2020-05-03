var express = require('express');
var router = express.Router();
const path = require('path');

/* GET home page. */
router.get('/', function (req, res, next) {

  res.redirect("/home/")

  //var x = path.join(__dirname,'/../public/template01/index.html');
  //var x = path.join('../template/index.html');
  //console.log(x)
  //res.sendFile(x);
    
  //var today =  new Date()
  // res.render('index', { 
  //   title: 'Express 1.10 '+today
  // });
});

module.exports = router;
