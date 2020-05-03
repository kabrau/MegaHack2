import 'package:flutter/material.dart';
import 'package:megahackapp/app/screens/register/components/form_container.dart';
import 'package:megahackapp/app/screens/register/register_controller.dart';
import 'package:megahackapp/app/shared/constants.dart';

class RegisterScreen extends StatelessWidget {
  final controller = RegisterController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cadastre-se",
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
            FormContainer(controller)
          ],
        ),
      ),
    );
  }
}