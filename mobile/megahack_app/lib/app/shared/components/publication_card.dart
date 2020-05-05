import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megahackapp/app/models/publication_model.dart';
import 'package:megahackapp/app/shared/constants.dart';

class PublicationCardWidget extends StatefulWidget {
  final Publication publication;
  final Function onTapComment;
  PublicationCardWidget(this.publication, this.onTapComment);
  @override
  _PublicationCardWidgetState createState() => _PublicationCardWidgetState();
}

class _PublicationCardWidgetState extends State<PublicationCardWidget> {
  bool like = false;
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
                                image: this.widget.publication.urlAvatar != null ?
                                NetworkImage("$APP_URL/images/${this.widget.publication.urlAvatar}") :
                                AssetImage("assets/images/$unknownAvatar"),
                                fit: BoxFit.cover
                            )),
                      ),
                      Container(
                        width: 200,
                        child:  Text(this.widget.publication.nameUser ?? "",
                          style: TextStyle(
                              fontSize: 15, color: blackColor,
                              fontFamily: "AvenirLTStd Light"),
                          maxLines: 1 ,

                        ),
                      )
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
                child: Text(this.widget.publication.description, maxLines: 1,),
              ),
            ),
            this.widget.publication.urlImage != null && this.widget.publication.urlImage != "" ? Container(
              color: greyColor,
              width: MediaQuery.of(context).size.width,
              height: 200,
              margin: EdgeInsets.only(top: 10),
              child: Image.network("$APP_URL/images/${this.widget.publication.urlImage}", fit: BoxFit.scaleDown,),
            ) : Container(),
            Padding(
              padding: EdgeInsets.only(top: 11, left: 14, right: 14, bottom: 13),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: this.widget.onTapComment,
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
                    onTap: (){
                      setState(() {
                        like = like ? false : true;
                      });
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(like ? Icons.favorite : Icons.favorite_border, color: Color(0xffC10000),),
                        Text(like ? "10": "  9",
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