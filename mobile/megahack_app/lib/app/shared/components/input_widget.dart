import 'package:flutter/material.dart';
import 'package:megahackapp/app/shared/constants.dart';

class InputField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final IconData icon;
  final Function(String) onChanged;
  final FormFieldValidator<String> validator;
  InputField({this.hint, this.obscure, this.icon, this.onChanged, this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          color: greyColor,
          borderRadius: BorderRadius.all(Radius.circular(40))
      ),
      child: TextFormField(
        onChanged: onChanged,
        obscureText: obscure,
        validator: validator,
        style: TextStyle(
          color: primaryColor,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: primaryColor,
            size: 24,
          ),
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            color: primaryColor,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
