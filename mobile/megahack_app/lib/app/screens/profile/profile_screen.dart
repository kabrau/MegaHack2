import 'package:flutter/material.dart';
import 'package:megahackapp/app/shared/constants.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blankColor,
        title: Text("Perfil", style: TextStyle(color: blackColor),),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Card(
              elevation: 10,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: GestureDetector(
                  child: Text("Teste"),
                  onTap: (){
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
