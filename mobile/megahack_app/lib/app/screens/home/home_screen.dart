import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megahackapp/app/screens/business_detail/business_detail_screen.dart';
import 'package:megahackapp/app/shared/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blankColor,
        title: Text("Home", style: TextStyle(color: blackColor),),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Card(
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: Icon
                              fit: BoxFit.cover
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(contactsList[index].name ?? "",
                              style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrangeAccent)),
                          Text(contactsList[index].email ?? "",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.deepOrangeAccent)),
                          Text(contactsList[index].phone ?? "",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.deepOrangeAccent))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
