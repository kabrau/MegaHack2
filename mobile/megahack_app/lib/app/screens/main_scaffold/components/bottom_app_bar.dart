import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:megahackapp/app/screens/main_scaffold/main_scaffold_controller.dart';
import 'package:megahackapp/app/shared/constants.dart';


class CustomBottomBar extends StatefulWidget {
  final MainScaffoldController _controller;
  CustomBottomBar(this._controller);
  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_){
        return Container(
          color: blankColor,
          child: BottomAppBar(
            color: blankColor,
            elevation: 0,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: blankColor,
                  boxShadow: [
                    BoxShadow(
                      color: secondaryColor,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30.0), topLeft: Radius.circular(30))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 20,
                          onPressed: (){
                            this.widget._controller.changePage(0);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.home, color: this.widget._controller.selectedIndex == 0 ? primaryColor : blackColor, size: 25),
                              Text(
                                "Home",
                                style: TextStyle(
                                    color: this.widget._controller.selectedIndex == 0 ? primaryColor : blackColor,
                                    fontSize: 8
                                ),
                              ),
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 30,
                          onPressed: (){
                            this.widget._controller.changePage(1);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.star, color: this.widget._controller.selectedIndex == 1 ? primaryColor : blackColor, size: 25),
                              Text(
                                "Pedidos",
                                style: TextStyle(
                                    color: this.widget._controller.selectedIndex == 1 ? primaryColor : blackColor,
                                    fontSize: 8
                                ),
                              ),
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 30,
                          onPressed: (){
                            this.widget._controller.changePage(2);
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.person, color: this.widget._controller.selectedIndex == 2 ? primaryColor : blackColor, size: 25),
                              Text("Perfil",
                                style: TextStyle(
                                    color: this.widget._controller.selectedIndex == 2 ? primaryColor : blackColor,
                                    fontSize: 8
                                ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            shape: CircularNotchedRectangle(),
          ),
        );
      },
    );
  }
}
