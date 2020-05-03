import 'package:flutter/material.dart';
import 'package:megahackapp/app/models/publication_model.dart';
import 'package:megahackapp/app/shared/constants.dart';

class PublicationCardWidget extends StatelessWidget {
  final Publication publication;
  PublicationCardWidget(this.publication);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top:10,left: 10,right: 10, bottom: 0 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 45.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: publication.urlAvatar != null ?
                                NetworkImage("http://equipe28.azurewebsites.net/images/${publication.urlAvatar}") :
                                AssetImage("assets/images/person_avatar.png"),
                                fit: BoxFit.cover
                            )),
                      ),
                      Text(publication.uidUser ?? "",
                          style: TextStyle(
                              fontSize: 18, color: blackColor,
                              fontFamily: "AvenirLTStd Light")),
                    ],
                  ),
                  Text("1 hora atrás" ?? "",
                      style: TextStyle(
                          fontSize: 12, color: grey4Color))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              width: MediaQuery.of(context).size.width,
              child: Divider(
                color: greyColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
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
            Padding(
              padding: EdgeInsets.only(top: 11, left: 14, right: 14, bottom: 13),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.chat_bubble, color: primaryColor,),
                        Text(" Comentários",
                          style: TextStyle(
                              color: grey3Color
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.favorite, color: Color(0xffC10000),),
                        Text("10",
                          style: TextStyle(
                              color: grey3Color
                          ),
                        ),
                      ],),
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}
