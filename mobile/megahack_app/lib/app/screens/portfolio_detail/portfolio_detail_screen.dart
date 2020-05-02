import 'package:flutter/material.dart';
import 'package:megahackapp/app/models/portfolio_model.dart';

class PortfolioDetail extends StatelessWidget {
  final Portfolio portfolio;

  PortfolioDetail(this.portfolio);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("${portfolio.description}"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Card(
              elevation: 10,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/2.5,
                  child:  ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        "http://equipe28.azurewebsites.net/images/${portfolio.urlImage}", fit: BoxFit.cover, )
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
