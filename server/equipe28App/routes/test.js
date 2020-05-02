var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function (req, res, next) {

    // var mysql = require('mysql');
    // var connection = mysql.createConnection({
    //     host: 'equipe28.mysql.database.azure.com',
    //     user: 'AdmEqp28@equipe28',
    //     password: 'RaulSeixas-0520',
    //     database: 'aquipertooficial'
    // });

    // connection.connect();
    // connection.query('select * from users', function (error, results, fields) {
    //     if (error) throw error;

    //     console.log('The solution is: ', results[0]);
    //     console.log('The solution is: ', fields);

    //     res.send(results);


    //   });
       
    //   connection.end();

    res.send("oi");

});

module.exports = router;
