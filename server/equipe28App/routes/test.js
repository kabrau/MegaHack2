var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var db = require('../dal/db.json');

/* GET home page. */
router.get('/', function (req, res, next) {

    var connection = mysql.createConnection(db[0]);

    connection.connect();
    
    connection.query('select * from users', function (error, results, fields) {
         if (error) throw error;

    //     console.log('The solution is: ', results[0]);
    //     console.log('The solution is: ', fields);

         res.send(results);
    });
       
    connection.end();

});

module.exports = router;
