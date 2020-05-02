import 'package:flutter/material.dart';
import 'package:megahackapp/app/shared/constants.dart';

class InputField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final IconData icon;

  InputField({this.hint, this.obscure, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                color: primaryColor,
                width: 1.0,
              )
          )
      ),
      child: TextFormField(
        obscureText: obscure,
        style: TextStyle(
          color: blackColor,
        ),
        decoration: InputDecoration(
          icon: Icon(
              icon,
              color: greyColor,
              size: 20,
          ),
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            color: greyColor,
            fontSize: 15,
          ),

        ),
      ),
    );
  }
}
