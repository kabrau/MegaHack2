import 'package:flutter/material.dart';
import 'package:megahackapp/app/shared/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(
              color: primaryColor,
              fontSize: 20
          ),
        ),
        backgroundColor: blankColor,
        iconTheme: IconThemeData(
            color: primaryColor
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
          ],
        ),
      ),
    );
  }
}
