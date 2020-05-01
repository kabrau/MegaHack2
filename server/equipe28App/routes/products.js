var express = require('express');
var router = express.Router();
var fs = require('fs');

/* GET products listing. */
router.get('/', function(req, res, next) {
  
  fs.readFile("./assets/products.json", "utf8", function(err, data){
    if (err) {
      var response = {status: "falha", resultado: err};
      res.json(response);
    } else {
      var obj = JSON.parse(data);
      var result = "Nenhum usuário foi encontrado";

      console.log(obj);
  
      result = obj;
      // obj.forEach(function(usuario) {

      //   if (usuario != null) {
      //     //if (usuario.usuario_id == req.query.usuario_id) {
      //       result = usuario;
      //    // }
      //   }
      // });
  
      var response = {status: "sucesso", resultado: result};
      res.json(response);
    }
  });



});

module.exports = router;
