import 'package:flutter/material.dart';
import 'package:megahackapp/app/screens/main_scaffold/main_scaffold_screen.dart';
import 'package:megahackapp/app/screens/register/register_screen.dart';
import 'package:megahackapp/app/shared/components/button_widget.dart';
import 'package:megahackapp/app/shared/components/input_widget.dart';
import 'package:megahackapp/app/shared/constants.dart';

class FormContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        child: Column(
          children: <Widget>[
            InputField(
              hint: "Username",
              obscure: false,
              icon: Icons.person_outline,
            ),
            InputField(
              hint: "Password",
              obscure: true,
              icon: Icons.lock_outline,
            ),
            ButtonWidget(
              onTap: (){
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(
                        builder: (context) => MainScaffoldScreen()
                    ),
                        (Route<dynamic> route) => false
                );
              },
              height: 40,
              width: 320,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegisterScreen()));
              },
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Não tem uma conta? Cadastra-se",
                  style: TextStyle(
                      color: greyColor,
                      fontSize: 15
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}