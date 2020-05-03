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
            child: BottomAppBar(
              color: blankColor,
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
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
                                Icon(Icons.home, color: this.widget._controller.selectedIndex == 0 ? secondaryColor : primaryColor, size: 30),
                                Text(
                                  "Home",
                                  style: TextStyle(
                                      color: this.widget._controller.selectedIndex == 0 ? secondaryColor : primaryColor,
                                      fontSize: 10
                                  ),
                                ),
                              ],
                            ),
                          ),
                          MaterialButton(
                            minWidth: 20,
                            onPressed: (){
                              this.widget._controller.changePage(1);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.subject, color: this.widget._controller.selectedIndex == 1 ? secondaryColor : primaryColor, size: 30),
                                Text(
                                  "Publicações",
                                  style: TextStyle(
                                      color: this.widget._controller.selectedIndex == 1 ? secondaryColor : primaryColor,
                                      fontSize: 10
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(height: 26),
                                Text( "Publicar",
                                  style: TextStyle(
                                      color: secondaryColor,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          MaterialButton(
                            minWidth: 30,
                            onPressed: (){
                              this.widget._controller.changePage(2);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.chat, color: this.widget._controller.selectedIndex == 2 ? secondaryColor : primaryColor, size: 30),
                                Text(
                                  "Mensagens",
                                  style: TextStyle(
                                      color: this.widget._controller.selectedIndex == 2 ? secondaryColor : primaryColor,
                                      fontSize: 10
                                  ),
                                ),
                              ],
                            ),
                          ),
                          MaterialButton(
                            minWidth: 30,
                            onPressed: (){
                              this.widget._controller.changePage(3);
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.account_circle, color: this.widget._controller.selectedIndex == 3 ? secondaryColor : primaryColor, size: 30),
                                Text("Perfil",
                                  style: TextStyle(
                                      color: this.widget._controller.selectedIndex == 3 ? secondaryColor : primaryColor,
                                      fontSize: 10
                                  ),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              shape: CircularNotchedRectangle(),
            ),
          );
        }
    );
  }
}
