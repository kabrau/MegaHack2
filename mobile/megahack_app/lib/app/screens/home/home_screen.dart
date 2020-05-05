import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:megahackapp/app/models/publication_model.dart';
import 'package:megahackapp/app/screens/home/home_controller.dart';
import 'package:megahackapp/app/screens/load_publication/load_publication_screen.dart';
import 'package:megahackapp/app/shared/components/publication_card.dart';
import 'package:megahackapp/app/shared/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = HomeController();
  @override
  void initState() {
    controller.fetchPublication();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top:10,left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("1 - 20 de 456 resultados",
                style: TextStyle(
                  fontFamily: "AvenirLTStd Medium",
                  color: grey4Color,
                  fontSize: 12
                ),
              ),
              Text("Últimas publicações",
                style: TextStyle(
                    fontFamily: "AvenirLTStd Medium",
                    color: primaryColor,
                    fontSize: 16
                ),
              ),

            ],
          ),
        ),
          Observer(
            builder: (_){
              if(controller.listPublication != null && controller.listPublication.value != null) {
                var list = controller.listPublication.value;
                return Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 14, left: 24, right: 24),
                      scrollDirection: Axis.vertical,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return PublicationCardWidget(list[index], (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoadPublicationScreen(list[index])));
                        });
                      }
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
      ],
    );
  }


}
