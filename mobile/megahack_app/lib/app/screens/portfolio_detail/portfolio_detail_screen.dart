import 'package:flutter/material.dart';
import 'package:megahackapp/app/models/portfolio_model.dart';
import 'package:megahackapp/app/shared/constants.dart';

class PortfolioDetail extends StatelessWidget {
  final Portfolio portfolio;

  PortfolioDetail(this.portfolio);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: blankColor,
        title: Text(
          "${portfolio.productName}",
          style: TextStyle(
              color: primaryColor,
              fontFamily: "AvenirLTStd Roman",
              fontSize: 22),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: primaryColor),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/2.5,
                  child:  ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        "$APP_URL/images/${portfolio.urlImage}", fit: BoxFit.cover, )
                  )
              ),
            Padding(
              padding: EdgeInsets.only(top:10),
              child: Center(
                child:Text("Descrição",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 18
                  ))
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
              child: Text("${portfolio.description}",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 14,
                ),
                maxLines: null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
