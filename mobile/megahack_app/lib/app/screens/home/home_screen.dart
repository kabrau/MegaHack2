import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:megahackapp/app/models/publication_model.dart';
import 'package:megahackapp/app/screens/home/home_controller.dart';
import 'package:megahackapp/app/shared/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = HomeController();
  @override
  Widget build(BuildContext context) {
    controller.fetchPublication();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blankColor,
        title: Text("Home", style: TextStyle(color: blackColor),),
        centerTitle: true,
      ),
      body: Container(
          child: Observer(
            builder: (_){
              if(controller.listPublication != null && controller.listPublication.value != null) {
                var list = controller.listPublication.value;
                return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return publicationCard(list[index], context);
                    }
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          )
      ),
    );
  }

  Card publicationCard(Publication publication, BuildContext context) {
    return Card(
                    elevation: 10,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top:10,left: 10,right: 10, bottom: 0 ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: publication.urlAvatar != null ?
                                          NetworkImage("http://equipe28.azurewebsites.net/images/${publication.urlAvatar}") :
                                          AssetImage("assets/images/person_avatar.png"),
                                          fit: BoxFit.cover
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(publication.uidUser ?? "",
                                          style: TextStyle(
                                              fontSize: 18, color: blackColor,
                                              fontWeight: FontWeight.w700)),
                                      Text(publication.lastupdateDate ?? "",
                                          style: TextStyle(
                                              fontSize: 18, color: blackColor))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Divider(
                              color: greyColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child:  Container(
                              child: Text(publication.description),
                            ),
                          ),
                          publication.urlImage != null ? Container(
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            margin: EdgeInsets.only(top: 10),
                            child: Image.network("http://equipe28.azurewebsites.net/images/${publication.urlImage}", fit: BoxFit.fitWidth,),
                          ) : Container(),
                          Container(
                            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                            width: MediaQuery.of(context).size.width,
                            child: Divider(
                              color: greyColor,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(Icons.thumb_up),
                                  Text("  Curtir"),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.comment),
                                  Text("  Comentar"),
                                ],)
                            ],
                          )
                        ],
                  )
                  );
  }
}
