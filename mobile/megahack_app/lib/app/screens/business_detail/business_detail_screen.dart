import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:megahackapp/app/screens/business_detail/business_detail_controller.dart';
import 'package:megahackapp/app/shared/constants.dart';

class BusinessDetailScreen extends StatelessWidget {

  final controller = BusinessDetailController();

//  var list = [
//    "SuperMercados",
//    "Farmácias",
//    "Lojas de construções",
//    "SuperMercados",
//    "Farmácias",
//    "Lojas de construções",
//  ];
  @override
  Widget build(BuildContext context) {
    Observer(
      builder: (_){
        print(controller.listProduct.value);
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Empresa x"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Card(
              elevation: 10,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2.5,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      color: primaryColor,
                      width: 350,
                      height: 200,
                    ),
                  ],
                )
              ),
            ),
           Observer(
             builder: (_){
               var list = controller.listProduct.value;
               return  Container(
                 width: MediaQuery.of(context).size.width,
                 height: 100,
                 child: ListView.builder(
                     scrollDirection: Axis.horizontal,
                     itemCount: list.length,
                     itemBuilder: (context, index){
                       return Container(
                         margin: EdgeInsets.all(10),
                         width: 200,
                         height: 150,
                         decoration: BoxDecoration(
                             color: secondaryColor,
                             borderRadius: BorderRadius.all(Radius.circular(10.0))
                         ),
                         child: Center(
                           child: Text(list[index].productName),
                         ),
                       );
                     }),
               );
             },
           )
          ],
        ),
      ),
    );
  }
}
