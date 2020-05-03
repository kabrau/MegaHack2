import 'package:flutter/material.dart';
import 'package:megahackapp/app/shared/constants.dart';

class ButtonWidget extends StatelessWidget {
  final Function onTap;
  final double width;
  final double height;

  ButtonWidget({this.onTap, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [terciaryColor, primaryColor],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black87,
                  offset: Offset(0, 2),
                  blurRadius: 10.0,
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: Center(
              child: Text(
            "ENTRAR",
            style: TextStyle(
                color: blankColor,
                fontSize: 18,
                fontFamily: "AvenirLTStd Black",
                letterSpacing: 0.3),
          ),
          ),
        ),
      ),
    );
  }
}
