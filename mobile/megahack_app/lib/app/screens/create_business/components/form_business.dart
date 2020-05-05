import 'package:flutter/material.dart';
import 'package:megahackapp/app/screens/create_business/create_business_controller.dart';
import 'package:megahackapp/app/screens/main_scaffold/main_scaffold_screen.dart';
import 'package:megahackapp/app/screens/register/register_controller.dart';
import 'package:megahackapp/app/shared/components/button_widget.dart';
import 'package:megahackapp/app/shared/components/input_widget.dart';

class FormContainer extends StatelessWidget {
  final CreateBusinessController controller;
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
              hint: "Nome da empresa",
              obscure: false,
              icon: Icons.store,
              onChanged: controller.changeName,
              validator: controller.validateName,
            ),
            InputField(
              hint: "CNPJ",
              obscure: false,
              icon: Icons.description,
              onChanged: controller.changeEmail,
              validator: controller.validateEmail,
            ),
            InputField(
              hint: "Categoria",
              obscure: false,
              icon: Icons.store,
              onChanged: controller.changeCpf,
              validator: controller.validateCpf,
            ),
            InputField(
              hint: "Telefone para Contato",
              obscure: false,
              icon: Icons.phone,
              onChanged: controller.changeAddress,
              validator: controller.validateAddress,
            ),
            InputField(
              hint: "Site do negócio",
              obscure: false,
              icon: Icons.alternate_email,
              onChanged: controller.changeAddress,
              validator: controller.validateAddress,
            ),
            InputField(
              hint: "CEP",
              obscure: false,
              icon: Icons.location_on,
              onChanged: controller.changeMobile,
              validator: controller.validateMobile,
            ),
            InputField(
              hint: "Endereço",
              obscure: false,
              icon: Icons.location_city,
              onChanged: controller.changeLogin,
              validator: controller.validateLogin,
            ),
            InputField(
              hint: "Número",
              obscure: false,
              icon: Icons.location_city,
              onChanged: controller.changePassword,
              validator: controller.validatePassword,
            ),
            InputField(
              hint: "Cidade",
              obscure: false,
              icon: Icons.location_city,
              onChanged: controller.changePassword,
              validator: controller.validatePassword,
            ),
            InputField(
              hint: "Estado (ex:SP)",
              obscure: false,
              icon: Icons.location_city,
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