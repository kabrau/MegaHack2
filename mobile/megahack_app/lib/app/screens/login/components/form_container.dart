import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:megahackapp/app/screens/login/login_controller.dart';
import 'package:megahackapp/app/screens/main_scaffold/main_scaffold_screen.dart';
import 'package:megahackapp/app/screens/register/register_screen.dart';
import 'package:megahackapp/app/shared/components/button_widget.dart';
import 'package:megahackapp/app/shared/components/input_widget.dart';
import 'package:megahackapp/app/shared/constants.dart';

class FormContainer extends StatelessWidget {
  final LoginController controller;
  FormContainer(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 73, bottom: 26, right: 44 , left: 44),
      child: Form(
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                InputField(
                  hint: "Digite seu usuário",
                  obscure: false,
                  icon: Icons.account_circle,
                  onChanged: controller.changeLogin,
                ),
                InputField(
                  hint: "Digite sua senha",
                  obscure: true,
                  icon: Icons.lock_outline,
                  onChanged: controller.changePassword,
                ),
                Padding(
                  padding: EdgeInsets.all(18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        child: Text("Esqueceu sua senha?", style: TextStyle(
                          fontFamily: "AvenirLTStd Black"
                        ),),
                      )
                    ],
                  ),
                )
              ],
            ),
           Observer(
             builder: (_){
               return  ButtonWidget(
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
               );
             }
           ),
            SizedBox(
              height: 62,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Divider(
                height: 2,
                color: blackColor,
              ),
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
                child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                          fontSize: 14,
                        color: grey3Color
                      ),
                      children: [
                        TextSpan(
                            text: "Junte-se a vizinhaça! "
                        ),
                        TextSpan(
                            text: 'Inscreva-se',
                            style: TextStyle(
                              color: secondaryColor,
                              fontFamily: "AvenirLTStd Black",
                            )
                        ),
                      ]
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}