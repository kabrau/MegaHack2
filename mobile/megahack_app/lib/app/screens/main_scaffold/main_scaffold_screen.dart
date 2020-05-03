import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:megahackapp/app/screens/chat/chat_screen.dart';
import 'package:megahackapp/app/screens/create_publication/create_publication_screen.dart';
import 'package:megahackapp/app/screens/home/home_screen.dart';
import 'package:megahackapp/app/screens/main_scaffold/components/app_bar.dart';
import 'package:megahackapp/app/screens/main_scaffold/components/bottom_app_bar.dart';
import 'package:megahackapp/app/screens/main_scaffold/main_scaffold_controller.dart';
import 'package:megahackapp/app/screens/my_messages/my_messages_screen.dart';
import 'package:megahackapp/app/screens/my_publication/my_publication_screen.dart';
import 'package:megahackapp/app/screens/profile/profile_screen.dart';
import 'package:megahackapp/app/screens/search/search_screen.dart';
import 'package:megahackapp/app/shared/constants.dart';

class MainScaffoldScreen extends StatefulWidget {
  @override
  _MainScaffoldScreenState createState() => _MainScaffoldScreenState();
}

class _MainScaffoldScreenState extends State<MainScaffoldScreen> {
  final controller = MainScaffoldController();
    List lisPages = [
      () => HomeScreen(),
      () => MyPublicationScreen(),
      () => MyMessagesScreen(),
      () => ProfileScreen()
    ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(
        builder: (_){
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(controller.selectedIndex == 0 ? "Feed"
                    : controller.selectedIndex == 1 ? "Minhas Publicações"
                    : controller.selectedIndex== 2 ? "Mensagens"
                    : "Meu Perfil" , style: TextStyle(
                    color: controller.selectedIndex == 1 ? blankColor : primaryColor,
                    fontFamily: "AvenirLTStd Roman",
                    fontSize: 22
                ),
                ),
                actions: <Widget>[
                  IconButton(
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SearchScreen(),
                        )
                      );
                    },
                    icon: Icon(Icons.search, color: controller.selectedIndex == 1 ? blankColor : primaryColor, size: 26,),
                    alignment: Alignment.centerRight,
                  ),
                ],
                backgroundColor: controller.selectedIndex == 1 ? primaryColor : blankColor,
                elevation: 0,
              ),
              body: lisPages[controller.selectedIndex](),
             floatingActionButton: FloatingActionButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CreatePublicationScreen(),
                    )
                  );
                },
                backgroundColor: secondaryColor,
                child: Icon(Icons.add, size: 28,),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: CustomBottomBar(controller)
          );
        },
      )
    );
  }
}
