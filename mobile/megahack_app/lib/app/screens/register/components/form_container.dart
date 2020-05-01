import 'package:flutter/material.dart';
import 'package:megahackapp/app/shared/components/button_widget.dart';
import 'package:megahackapp/app/shared/components/input_widget.dart';

class FormContainer extends StatelessWidget {

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
              icon: Icons.person_outline,
            ),
            InputField(
              hint: "Email",
              obscure: true,
              icon: Icons.lock_outline,
            ),
            InputField(
              hint: "Celular",
              obscure: true,
              icon: Icons.lock_outline,
            ),
            InputField(
              hint: "Email",
              obscure: true,
              icon: Icons.lock_outline,
            ),
            InputField(
              hint: "CPF",
              obscure: true,
              icon: Icons.lock_outline,
            ),
            InputField(
              hint: "Cidade",
              obscure: true,
              icon: Icons.lock_outline,
            ),
            ButtonWidget(
              onTap: (){},
              height: 40,
              width: 320,
            ),
          ],
        ),
      ),
    );
  }
}