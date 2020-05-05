import 'package:flutter/material.dart';
import 'package:megahackapp/app/shared/constants.dart';

class MyMessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 25, top: 10, bottom: 14),
          child: Text("Conversas",
          style: TextStyle(
            color: primaryColor,
            fontFamily: "AvenirLTStd Medium",
            fontSize: 16
          ),),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 15 ),
            children: <Widget>[
              Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      width: 45.0,
                                      height: 45.0,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/$unknownAvatar"),
                                              fit: BoxFit.cover)),
                                    ),
                                    Positioned(
                                      right: 0,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 10),
                                        width: 12.0,
                                        height: 12.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xff04CC00),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Text("Alfredo Alcântra",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: blackColor,
                                        fontFamily: "AvenirLTStd Light")),
                              ],
                            ),
                            Text("1 hora atrás" ?? "",
                                style: TextStyle(fontSize: 12, color: grey4Color))
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        )
      ],
    );
  }
}
