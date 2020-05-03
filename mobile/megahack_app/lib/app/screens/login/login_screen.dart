import 'package:flutter/material.dart';
import 'package:megahackapp/app/screens/login/components/form_container.dart';
import 'package:megahackapp/app/screens/login/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final controller = LoginController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 70),
                    child: Image.asset("assets/images/logo_screen.png", height: 131, width: 133,),
                  ),
                  FormContainer(controller),
                ],
              ),
            )
        ),
      )
    );
  }
}
