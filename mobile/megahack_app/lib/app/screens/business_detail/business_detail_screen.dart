import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:megahackapp/app/models/company_model.dart';
import 'package:megahackapp/app/screens/business_detail/business_detail_controller.dart';
import 'package:megahackapp/app/screens/portfolio_detail/portfolio_detail_screen.dart';
import 'package:megahackapp/app/shared/constants.dart';
import 'package:transparent_image/transparent_image.dart';

class BusinessDetailScreen extends StatelessWidget {
//  final Company company;
//  BusinessDetailScreen(this.company);

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
    controller.fetchPortfolios();
    return Scaffold(
      appBar: AppBar(
        title: Text("teste")
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(Icons.star),
                        Text("(4,5)")
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 350,
                      height: 150,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: "https://cdn.portalcbncampinas.com.br/wp-content/uploads/2019/10/portalcbncampinas.com.br-portalcbncampinas.com_.br-ceasa-de-campinas-espera-5-de-crescimento-em-2019-na-venda-de-flores-para-o-dia-de-finados-whatsapp-image-2019-10-30-at-14.53.48.jpeg",
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                          )
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                  "Floricultura da Dona Lúcia",
                                style: TextStyle(
                                 fontWeight: FontWeight.w700,
                                  fontSize: 20
                                ),
                              ),
                              Text("Comércio - 1,0 km"),
                              RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black
                                    ),
                                    children: [
                                      TextSpan(
                                          text: "Dona(o) "
                                      ),
                                      TextSpan(
                                          text: 'Lúcia da Silva',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500
                                          )
                                      ),
                                    ]
                                ),
                              )
                            ],
                          ),
                          Icon(Icons.mode_comment)
                        ],
                      ),
                    )
                  ],
                )
              ),
            ),
           Padding(
             padding: EdgeInsets.all(10),
             child: Text("Portfólio"),
           ),
           Observer(
             builder: (_){
               if(controller.listPortfolio != null && controller.listPortfolio.value != null) {
                 var list = controller.listPortfolio.value;
                 return Container(
                   width: MediaQuery
                       .of(context)
                       .size
                       .width,
                   height: 100,
                   child: ListView.builder(
                       scrollDirection: Axis.horizontal,
                       itemCount: list.length,
                       itemBuilder: (context, index) {
                         return GestureDetector(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(

                                 builder: (context) => PortfolioDetail(list[index])));
                           },
                           child: Container(
                               margin: EdgeInsets.all(10),
                               width: 200,
                               height: 150,
                               decoration: BoxDecoration(
                                   color: greyColor,
                                   borderRadius: BorderRadius.all(
                                       Radius.circular(10.0))
                               ),
                               child: ClipRRect(
                                   borderRadius: BorderRadius.circular(8.0),
                                   child: Image.network(
                                     "http://equipe28.azurewebsites.net/images/${list[index].urlImage}", fit: BoxFit.cover, )
                               )
                           ),
                         );
                       }),
                 );
               } else {
                 return Center(
                   child: Container(
                       width: 50,
                       height: 50,
                       child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(primaryColor)),
                     ),
                 );
               }
             },
           ),
            Row(
              children: <Widget>[
                Text("Comentários")
              ],
            )
          ],
        ),
      ),
    );
  }
}
