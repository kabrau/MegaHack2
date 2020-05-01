import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megahackapp/app/screens/business_detail/business_detail_screen.dart';
import 'package:megahackapp/app/shared/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(

                            builder: (context) => BusinessDetailScreen()));
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
