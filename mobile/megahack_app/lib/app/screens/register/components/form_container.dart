import 'package:flutter/material.dart';
import 'package:megahackapp/app/screens/main_scaffold/main_scaffold_screen.dart';
import 'package:megahackapp/app/screens/register/register_controller.dart';
import 'package:megahackapp/app/shared/components/button_widget.dart';
import 'package:megahackapp/app/shared/components/input_widget.dart';

class FormContainer extends StatelessWidget {
  final RegisterController controller;
  FormContainer(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        child: Column(
          children: <Widget>[
            InputField(
              hint: "Nome",
              obscure: false,
              icon: Icons.account_circle,
            ),
            InputField(
              hint: "Email",
              obscure: true,
              icon: Icons.alternate_email,
            ),
            InputField(
              hint: "Celular",
              obscure: true,
              icon: Icons.phone_android,
            ),
            InputField(
              hint: "CPF",
              obscure: true,
              icon: Icons.subtitles,
            ),
            InputField(
              hint: "Cidade",
              obscure: true,
              icon: Icons.location_city,
            ),
            InputField(
              hint: "Senha",
              obscure: true,
              icon: Icons.lock_outline,
            ),
            ButtonWidget(
              width: 288,
              height: 51,
              value: Text("ENTRAR"),
              isValid: controller.isValid,
              onTap: (){
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(
                        builder: (context) => MainScaffoldScreen()
                    ),
                        (Route<dynamic> route) => false
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}