import 'package:flutter/material.dart';
import 'package:megahackapp/app/screens/main_scaffold/main_scaffold_screen.dart';
import 'package:megahackapp/app/screens/register/register_controller.dart';
import 'package:megahackapp/app/shared/components/button_widget.dart';
import 'package:megahackapp/app/shared/components/input_widget.dart';

class FormContainer extends StatelessWidget {
  final RegisterController controller;
  FormContainer(this.controller);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            InputField(
              hint: "Nome",
              obscure: false,
              icon: Icons.account_circle,
              onChanged: controller.changeName,
              validator: controller.validateName,
            ),
            InputField(
              hint: "Email",
              obscure: false,
              icon: Icons.alternate_email,
              onChanged: controller.changeEmail,
              validator: controller.validateEmail,
            ),
            InputField(
              hint: "Celular",
              obscure: false,
              icon: Icons.phone_android,
              onChanged: controller.changeMobile,
              validator: controller.validateMobile,
            ),
            InputField(
              hint: "CPF",
              obscure: false,
              icon: Icons.subtitles,
              onChanged: controller.changeCpf,
              validator: controller.validateCpf,
            ),
            InputField(
              hint: "Cidade",
              obscure: false,
              icon: Icons.location_city,
              onChanged: controller.changeAddress,
              validator: controller.validateAddress,
            ),
            InputField(
              hint: "Login",
              obscure: false,
              icon: Icons.account_circle,
              onChanged: controller.changeLogin,
              validator: controller.validateLogin,
            ),
            InputField(
              hint: "Senha",
              obscure: false,
              icon: Icons.lock_outline,
              onChanged: controller.changePassword,
              validator: controller.validatePassword,
            ),
            ButtonWidget(
              width: 288,
              height: 51,
              value: "CADASTRAR",
              isValid: controller.isValid,
              onTap: () async{
               if(_formKey.currentState.validate()){
                 var response = await controller.registerUser();
                 if(response == "sucesso"){
                   print("Response 200");
                   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                       builder: (context)=> MainScaffoldScreen())
                       ,(Route<dynamic> route) => false);
                 }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}