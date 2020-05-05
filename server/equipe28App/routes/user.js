var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var dbConfig = require('../config/config.json')["db"];

var DbModel = require('../model/model');

var tableName = "users"

var connection = mysql.createPool(dbConfig);

var myDbModel = new DbModel(tableName, connection)


router.get(`/:id/feed`, function (req, res, next) {
    var uid = req.params.id;

    connection.query(`select p.*, u.url_avatar, u.name as name_user from publications as p left join users as u on p.uid_user=u.uid where request=0 and p.uid_user="${uid}"`, [uid], function (error, results, fields) {
        if (error) throw res.json({ status: "falha", resultado: error });
        if (results.length == 0) res.json({ status: "falha", resultado: results})
        else{ 
            res.json({ status: "sucesso", resultado: results });
        };
    });

});

router.get(`/:id/request`, function (req, res, next) {
    var uid = req.params.id;

    connection.query(`select p.*, u.url_avatar, u.name as name_user from publications as p left join users as u on p.uid_user=u.uid where request=1 and p.uid_user="${uid}"`, [uid], function (error, results, fields) {
        if (error) throw res.json({ status: "falha", resultado: error });
        if (results.length == 0) res.json({ status: "falha", resultado: results })
        else{ 
            res.json({ status: "sucesso", resultado: results });
        };
    })

});
router.get(`/:id/company`, function (req, res, next) {
    var uid = req.params.id;

    connection.query(`select * from companies where adm_uid_user="${uid}"`, [uid], function (error, results, fields) {
        if (error) throw res.json({ status: "falha", resultado: error });
        if (results.length == 0) res.json({ status: "falha", resultado: results })
        else{ 
            res.json({ status: "sucesso", resultado: results });
        };
    })

});


router.get('/list', function (req, res, next) {

    myDbModel.dbGetList()
        .then((result) => { res.json({ status: "sucesso", resultado: result }); })
        .catch((err) => { res.json({ status: "falha", resultado: err }); })

});

router.put('/add', function (req, res, next) {
    var newUser = req.body;

    myDbModel.dbInsert(newUser)
        .then((result) => { res.json({ status: "sucesso", resultado: result }); })
        .catch((err) => { res.json({ status: "falha", resultado: err }); })
});

router.post('/update/:id', function (req, res, next) {

    var uid = req.params.id;
    var updUser = req.body;

    myDbModel.dbUpdate(uid, updUser)
        .then((result) => { res.json({ status: "sucesso", resultado: result }); })
        .catch((err) => { res.json({ status: "falha", resultado: err }); })

});

router.delete('/delete/:id', function (req, res, next) {

    var uid = req.params.id;

    myDbModel.dbDelete(uid)
        .then((result) => { res.json({ status: "sucesso", resultado: result }); })
        .catch((err) => { res.json({ status: "falha", resultado: err }); })

});

router.get('/:id', function (req, res, next) {

    var uid = req.params.id;

    myDbModel.dbGetList({ "uid": uid })
        .then((result) => { res.json({ status: "sucesso", resultado: result }); })
        .catch((err) => { res.json({ status: "falha", resultado: err }); })

})

router.get('/login/:loginName/:password', function (req, res, next) {

    var loginName = req.params.loginName;
    var {password}= req.params;

    myDbModel.dbGetList({ "nickname": loginName })
        .then((result) => {
            if (result.length > 0){
                connection.query(`select * from users where nickname="${loginName}" and password="${password}"`, function (error, results, fields) {
                    if (error) throw res.json({ status: "falha", resultado: error });
                    if (results.length == 0) res.json({ status: "falha", resultado: {"message": "Usuario não encontrado"} })
                    else{ 
                        res.json({ status: "sucesso", resultado: results });
                    };
                });
            } else
                myDbModel.dbGetList({ "email": loginName })
                    .then((result) => {
                        if (result.length > 0){
                            connection.query(`select * from users where email="${loginName}" and password="${password}"`, function (error, results, fields) {
                                if (error) throw res.json({ status: "falha", resultado: error });
                                if (results.length == 0) res.json({ status: "falha", resultado: {"message": "Usuario não encontrado"} })
                                else{ 
                                    res.json({ status: "sucesso", resultado: results });
                                };
                            });
                        }
                        else
                            res.json({ status: "falha", resultado: "usuário não encontrado" });
                    })
                    .catch((err) => { res.json({ status: "falha", resultado: err }); })
        })
        .catch((err) => { res.json({ status: "falha", resultado: err }); })

})


module.exports = router;
