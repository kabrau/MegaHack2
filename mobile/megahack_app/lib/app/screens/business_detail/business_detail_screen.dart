import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:megahackapp/app/models/company_model.dart';
import 'package:megahackapp/app/screens/business_detail/business_detail_controller.dart';
import 'package:megahackapp/app/screens/business_map/business_map_screen.dart';
import 'package:megahackapp/app/screens/portfolio_detail/portfolio_detail_screen.dart';
import 'package:megahackapp/app/shared/constants.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

class BusinessDetailScreen extends StatelessWidget {
  final Company company;

  BusinessDetailScreen(this.company);

  final controller = BusinessDetailController();
  var i = 4;
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
    controller.fetchPortfolios(company.uid);
    controller.fetchCoordenate(company.adress,company.adressNumber,company.city, company.state);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blankColor,
        title: Text(
          "${company.name}",
          style: TextStyle(
              color: primaryColor,
              fontFamily: "AvenirLTStd Roman",
              fontSize: 22),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: primaryColor),
        actions: <Widget>[
         IconButton(
           icon: Icon(Icons.map, color: primaryColor, size: 30,),
           onPressed: (){
             Navigator.of(context).push(
                 MaterialPageRoute(
                     builder: (context) => BusinessMapScreen(company: company, lat: controller.lat, lng: controller.lng,)
                 ));
           },
         )
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
          Card(
            margin: EdgeInsets.only(left: 15, right: 15, top: 10),
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
              child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10,right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(Icons.star, color: secondaryColor,),
                        Text("(4,5)", style: TextStyle(
                          color: secondaryColor,
                          fontSize: 16
                        ),)
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.all(10),
                      width: 350,
                      height: 150,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: company.urlLogo != null ?
                          FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: "$APP_URL/images/${company.urlLogo}",
                            fit: BoxFit.cover,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                          ) : AssetImage("assets/images/$unknownCompany"),
                      )
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              company.name,
                              style: TextStyle(
                                fontFamily: "AvenirLTStd Black",
                                  fontSize: 20,
                                color: primaryColor
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                launch('http:${company.site}');
                              },
                              child: Text(
                                company.site,
                                style: TextStyle(
                                    fontFamily: "AvenirLTStd Medium",
                                    fontSize: 16,
                                    color: primaryColor
                                ),
                              ),
                            ),
                            Text("Comércio - 1,0 km",
                              style: TextStyle(
                                  color: grey3Color
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                           Padding(
                             padding: EdgeInsets.only(right: 10),
                             child: GestureDetector(
                               onTap: (){
                                 launch("tel:${company.foneContact}");
                               },
                               child: Icon(Icons.phone, color: secondaryColor,),
                             )
                           ),
                            Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: GestureDetector(
                                  child: Icon(Icons.chat, color: secondaryColor,),
                                )
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:10),
                    child: Text("Descrição",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 18
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
                        child: Text("${company.description}",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 14,
                          ),
                          maxLines: null,
                        ),
                  )
                ],
              )
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, top: 15, bottom: 10),
          child: Text("Portfólio", style: TextStyle(color: primaryColor, fontSize: 16),),
        ),
        Observer(
          builder: (_) {
            if (controller.listPortfolio != null &&
                controller.listPortfolio.value != null) {
              var list = controller.listPortfolio.value;
              return Container(
                margin: EdgeInsets.only(left: 15),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 130,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(

                              builder: (context) =>
                                  PortfolioDetail(list[index])));
                        },
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                  width: 200,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: greyColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        "$APP_URL/images/${list[index]
                                            .urlImage}", fit: BoxFit.cover,)
                                  )
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Text("${list[index].productName}", style: TextStyle(color: primaryColor),),
                              )
                            ],
                          ),
                        )
                      );
                    }),
              );
            } else {
              return Center(
                child: Container(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          primaryColor)),
                ),
              );
            }
          },
        ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, bottom: 10),
              child: Text("Comentários", style: TextStyle(color: primaryColor, fontSize: 16),),
            ),
        Card(
          elevation: 10,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: 10, left: 10, right: 10, bottom: 0),
                  child: Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("assets/images/$unknownAvatar"),
                                fit: BoxFit.cover
                            )),
                      ),
                ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Neide do 51",
                                style: TextStyle(
                                    fontSize: 18, color: blackColor,
                                    fontWeight: FontWeight.w700)),
                            Row(
                              children: <Widget>[
                                Text("$i,0"),
                                Icon(this.i >= 1 ? Icons.star : Icons.star_border, size: 20, color: secondaryColor),
                                Icon(this.i >= 2 ? Icons.star : Icons.star_border, size: 20, color: secondaryColor),
                                Icon(this.i >= 3 ? Icons.star : Icons.star_border, size: 20, color: secondaryColor),
                                Icon(this.i >= 4 ? Icons.star : Icons.star_border, size: 20, color: secondaryColor),
                                Icon(this.i == 5 ? Icons.star : Icons.star_border, size: 20, color: secondaryColor,),
                              ],
                            ),
                           Container(
                             margin: EdgeInsets.only(top: 10),
                                child: Text("Produtos de boa qualidade!"),
                            ),
                          ],
                        ),
                ),
              ]))
          ],
        ),
      ),
    );
  }
}
