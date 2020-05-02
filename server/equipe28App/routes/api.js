var express = require('express');
var router = express.Router();
var fs = require('fs');
var mysql = require('mysql');
var dbConfig = require('../config/config.json')["db"];

// var users = require('./user');
// router.route('/users')
//       .post(validate, user.createUser);

//{ routName: "user", tableName: "users" },

tabelas = [
    
    { routName: "comment", tableName: "comments" },
    { routName: "company", tableName: "companies" },
    { routName: "portfolio", tableName: "portfolio" },
    { routName: "publication", tableName: "publications" },
    { routName: "category", tableName: "categories" }
]

/* GET API list */
router.get('/', function (req, res, next) {

    var body = 'Lista de rotas <br>';
    body += '<br>';

    tabelas.forEach(e => {
        body += `api/${e.routName}/list<br>`
        body += `api/${e.routName}/[uid]<br>`
        body += '<br>';
    });

    body += 'api/company/[uid]/portfolio';
    body += '<br>';

    body += 'api/publication/feed';
    body += '<br>';

    res.send(body);
});



tabelas.forEach(e => {

    router.get(`/${e.routName}/list`, function (req, res, next) {

        var connection = mysql.createConnection(dbConfig);

        connection.connect();

        connection.query(`select * from ${e.tableName}`, function (error, results, fields) {
            if (error) throw res.json({ status: "falha", resultado: error });

            var response = { status: "sucesso", resultado: results };
            res.json(response);
        });

        connection.end();

    });


    router.get(`/${e.routName}/:id`, function (req, res, next) {

        var uid = req.params.id;

        var connection = mysql.createConnection(dbConfig);

        connection.connect();

        connection.query(`select * from ${e.tableName} where uid="${uid}"`, function (error, results, fields) {
            if (error) throw res.json({ status: "falha", resultado: error });
            if (results.length == 0) throw res.json({ status: "falha", resultado: `Nenhum registro foi encontrado ${uid}` });

            res.json({ status: "sucesso", resultado: results });

        });

        connection.end();

    });


    router.get(`/company/:id/portfolio`, function (req, res, next) {
        var uid = req.params.id;

        var connection = mysql.createConnection(dbConfig);

        connection.connect();

        connection.query(`select * from portfolio where uid_company="${uid}"`, function (error, results, fields) {
            if (error) throw res.json({ status: "falha", resultado: error });
            if (results.length == 0) throw res.json({ status: "falha", resultado: `Nenhum registro foi encontrado ${uid}` });

            res.json({ status: "sucesso", resultado: results });

        });

        connection.end();
    });


    router.get(`/publication/feed`, function (req, res, next) {
        var uid = req.params.id;

        var connection = mysql.createConnection(dbConfig);

        connection.connect();

        connection.query(`select p.*, u.url_avatar from publications as p left join users as u on p.uid_user=u.uid`, function (error, results, fields) {
            if (error) throw res.json({ status: "falha", resultado: error });
            if (results.length == 0) throw res.json({ status: "falha", resultado: `Nenhum registro foi encontrado ${uid}` });

            res.json({ status: "sucesso", resultado: results });

        });

        connection.end();
    });





});


module.exports = router;
