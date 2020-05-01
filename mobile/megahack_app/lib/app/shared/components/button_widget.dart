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
              color: primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(5.0))
          ),
          child: Text(
            "ENTRAR",
            style: TextStyle(
                color: blackColor,
                fontSize: 15,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.3
            ),
          ),
        ),
      ),
    );
  }
}