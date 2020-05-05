import 'package:flutter/material.dart';
import 'package:megahackapp/app/shared/constants.dart';

class ButtonWidget extends StatelessWidget {

  final String value;
  final bool isValid;
  final Function onTap;
  final double width;
  final double height;


  ButtonWidget({
    this.onTap,
    this.value,
    this.isValid,
    this.width,
    this.height
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: isValid ? onTap : null,
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: isValid ? BoxDecoration(
              color: Color(0xffF7921E) ,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black87,
                  offset: Offset(0, 2),
                  blurRadius: 10.0,
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(50))
          ) : BoxDecoration(
              color: Color(0xffF5C38A),
              borderRadius: BorderRadius.all(Radius.circular(50))
          ),
          child: Center(
            child: Text(
              value,
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

