var express = require('express');
var router = express.Router();
var fs = require('fs');
var mysql = require('mysql');
var db = require('../dal/db.json');

tabelas = [
    { routName: "user", tableName: "users" },
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

    body += '<br>';
    // body += '<br>';
    // body += 'Commands<br>';
    // body += '/list';


    res.send(body);
});



tabelas.forEach(e => {

    router.get(`/${e.routName}/list`, function (req, res, next) {
        // fs.readFile(`./assets/${e.tableName}.json`, "utf8", function (err, data) {
        //     if (err) {
        //         var response = { status: "falha", resultado: err };
        //         res.json(response);
        //     } else {
        //         var result = JSON.parse(data);
        //         var response = { status: "sucesso", resultado: result };
        //         res.json(response);
        //     }
        // });

        var connection = mysql.createConnection(db[0]);

        connection.connect();

        connection.query(`select * from ${e.tableName}`, function (error, results, fields) {
            if (error) throw error;
   
            res.send(results);
       });
          
       connection.end();

    });


    router.get(`/${e.routName}/:id`, function (req, res, next) {
        fs.readFile(`./assets/${e.tableName}.json`, "utf8", function (err, data) {
            if (err) {
                var response = { status: "falha", resultado: err };
                res.json(response);
            } else {

                var uid = req.params.id;
                var obj = JSON.parse(data);

                var result = `Nenhum registro foi encontrado ${uid}`;
                var status = "erro"

                // obj.forEach(function (el) {

                //     if (el != null) {
                //         if (el.uid == uid) {
                //             result = el;
                //             status ="sucesso"
                //         }
                //     }
                // });

                // var response = { status: status, resultado: result };
                // res.json(response);

                var connection = mysql.createConnection(db[0]);

                connection.connect();
        
                connection.query(`select * from ${e.tableName} where uid="${uid}"`, function (error, results, fields) {
                    if (error) throw error;
           
                    res.send(results);
               });
                  
               connection.end();
            }
        });
    });


});






// fs.readFile("./assets/products.json", "utf8", function(err, data){
//     if (err) {
//       var response = {status: "falha", resultado: err};
//       res.json(response);
//     } else {
//       var obj = JSON.parse(data);
//       var result = "Nenhum usuário foi encontrado";

//       console.log(obj);

//       result = obj;
//       // obj.forEach(function(usuario) {

//       //   if (usuario != null) {
//       //     //if (usuario.usuario_id == req.query.usuario_id) {
//       //       result = usuario;
//       //    // }
//       //   }
//       // });

//       var response = {status: "sucesso", resultado: result};
//       res.json(response);
//     }
//   });











module.exports = router;
