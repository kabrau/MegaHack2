import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:megahackapp/app/screens/chat/chat_screen.dart';
import 'package:megahackapp/app/screens/create_publication/create_publication_screen.dart';
import 'package:megahackapp/app/screens/create_request/create_request_screen.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    controller.fetchCategories();
    super.initState();
  }
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
             floatingActionButton: SpeedDial(
               backgroundColor: secondaryColor,
               child: Icon(Icons.more_horiz),
               marginRight: MediaQuery.of(context).size.width/2.35,
               marginBottom: -25,
               children: [
                 SpeedDialChild(
                   backgroundColor: primaryColor,
                   child: Icon(
                     Icons.create,
                     color: blankColor,
                     size: 25,
                   ),
                   label: "Publicar",
                   onTap: (){
                     Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CreatePublicationScreen(),
                      )
                    );
                   }
                 ),
                 SpeedDialChild(
                   backgroundColor: primaryColor,
                     child: Icon(
                       Icons.announcement,
                       color: blankColor,
                       size: 25,
                     ),
                     label: "Fazer pedido",
                     onTap: (){
                       Navigator.of(context).push(
                           MaterialPageRoute(
                             builder: (context) => CreateRequestScreen(),
                           )
                       );
                     }
                 )
               ],
             ),
//                onPressed: (){
//                  Navigator.of(context).push(
//                    MaterialPageRoute(
//                      builder: (context) => CreatePublicationScreen(),
//                    )
//                  );
//                },
              bottomNavigationBar: CustomBottomBar(controller)
          );
        },
      )
    );
  }
}
