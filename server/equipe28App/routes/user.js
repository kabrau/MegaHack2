var express = require('express');
var router = express.Router();
var fs = require('fs');
var mysql = require('mysql');
var mysqlBackbone = require('mysql-backbone');
var dbConfig = require('../config/config.json')["db"];

var guid = require('../lib/guid');
var model = require('../model/models');

var tableName = "users"

modelUser = model.UserFields();


/* GET API list */
router.get('/list', function (req, res, next) {

    var connection = mysql.createConnection(dbConfig);
    connection.connect();

    var User = mysqlBackbone.Model.extend({
        connection: connection,
        tableName: "users",
    });

    var Users = mysqlBackbone.Collection.extend({
        model: User,
        connection: connection,
        tableName: "movies",
    });


    users = new Users();

    users.fetch().then(function (rows) {
        var response = { status: "sucesso", resultado: rows };
        res.json(response);
    });

    connection.end();
});


router.put('/add', function (req, res, next) {

    var connection = mysql.createConnection(dbConfig);
    connection.connect();


    fields = ["uid"]
    values = [guid.GUID()]

    newUser = req.body;
    for (var fieldName in newUser) {
        if (modelUser.find(f => f == fieldName)) {
            fields.push(fieldName)
            values.push(newUser[fieldName])
        }
    }

    connection.query(`insert into ${tableName} (${fields}) values (?)`, [values], function (error) {
        if (error) throw res.json({ status: "falha", resultado: error });

        console.log('adicionou registros!');
        res.json({ status: "sucesso", resultado: [fields, values] });

        connection.end();
    });
});


router.post('/update/:id', function (req, res, next) {

    var uid = req.params.id;
    var updUser = req.body;

    var connection = mysql.createConnection(dbConfig);
    connection.connect();

    fields = ["uid"]
    values = [guid.GUID()]

    sqlUpdate = ""
    for (var fieldName in updUser) {
        if (modelUser.find(f => f == fieldName)) {
            if (sqlUpdate != "")
                sqlUpdate += ","
            sqlUpdate += `${fieldName}='${updUser[fieldName]}'`

            fields.push(fieldName)
            values.push(updUser[fieldName])
        }
    }

    console.log(`update ${tableName} set ${sqlUpdate} where uid='${uid}'`)

    connection.query(`update ${tableName} set ${sqlUpdate} where uid='${uid}'`, function (error) {
        if (error) throw res.json({ status: "falha", resultado: error });

        console.log('updated!');
        res.json({ status: "sucesso", resultado: [fields, values] });

        connection.end();
    });
});

router.delete('/delete/:id', function (req, res, next) {

    var uid = req.params.id;

    var connection = mysql.createConnection(dbConfig);
    connection.connect();

    connection.query(`delete from ${tableName} where uid='${uid}'`, function (error) {
        if (error) throw res.json({ status: "falha", resultado: error });

        console.log('deleted!');
        res.json({ status: "sucesso", resultado: [uid] });
        connection.end();
    });
});

router.get('/:id', function (req, res, next) {

    var uid = req.params.id;

    var connection = mysql.createConnection(dbConfig);

    connection.connect();

    connection.query(`select * from ${tableName} where uid="${uid}"`, function (error, results, fields) {
        if (error) throw res.json({ status: "falha", resultado: error });
        if (results.length == 0) throw res.json({ status: "falha", resultado: `Nenhum registro foi encontrado ${uid}` });

        res.json({ status: "sucesso", resultado: results });

    });

    connection.end();

})


module.exports = router;
