import 'package:flutter/material.dart';
import 'package:megahackapp/app/shared/constants.dart';

class AppBarMenu extends StatelessWidget implements PreferredSizeWidget {
  final Function() onPressedFirstIcon;
  final Function() onPressedSecondIcon;
  final IconData firstIcon;
  final IconData secondIcon;
  final Color colorIcons;


  @override
  Size get preferredSize => Size.fromHeight(100);

  const AppBarMenu({
    Key key,
    @required this.onPressedFirstIcon,
    @required this.onPressedSecondIcon,
    this.firstIcon,
    this.secondIcon,
    this.colorIcons
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: onPressedFirstIcon,
            icon:  Icon(
              firstIcon,
              color: colorIcons,
            ),
          ),
          IconButton(
            onPressed: onPressedSecondIcon,
            icon: Icon(
              secondIcon,
              color: colorIcons,
            ),
          )
        ],
      ),
    );
  }
}