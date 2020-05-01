import 'package:flutter/material.dart';
import 'package:megahackapp/app/screens/login/components/form_container.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/3,
                    child: Icon(Icons.done, size: 200,),
                  ),
                  FormContainer(),
                ],
              ),
            ],
          )
      ),
    );
  }
}
