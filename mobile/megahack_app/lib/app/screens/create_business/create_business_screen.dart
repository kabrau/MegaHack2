import 'package:flutter/material.dart';
import 'package:megahackapp/app/screens/create_business/components/form_business.dart';
import 'package:megahackapp/app/screens/create_business/create_business_controller.dart';
import 'package:megahackapp/app/shared/constants.dart';

class CreateBusinessScreen extends StatelessWidget {
  final controller = CreateBusinessController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Criar Empresa",
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