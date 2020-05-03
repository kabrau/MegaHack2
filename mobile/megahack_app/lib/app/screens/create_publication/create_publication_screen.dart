import 'package:flutter/material.dart';
import 'package:megahackapp/app/shared/constants.dart';

class CreatePublicationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blankColor,
        title: Text("Criar Publicação", style: TextStyle(color: primaryColor, fontFamily: "AvenirLTStd Roman",
            fontSize: 22),),
        centerTitle: true,
        iconTheme: IconThemeData(
            color: primaryColor
        ),
      ),
      body: Column(
        children: <Widget>[

        ],
      ),
    );
  }
}
