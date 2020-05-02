import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:megahackapp/app/screens/chat/chat_screen.dart';
import 'package:megahackapp/app/screens/home/home_screen.dart';
import 'package:megahackapp/app/screens/main_scaffold/components/app_bar.dart';
import 'package:megahackapp/app/screens/main_scaffold/components/bottom_app_bar.dart';
import 'package:megahackapp/app/screens/main_scaffold/main_scaffold_controller.dart';
import 'package:megahackapp/app/screens/profile/profile_screen.dart';
import 'package:megahackapp/app/screens/search/search_screen.dart';
import 'package:megahackapp/app/shared/constants.dart';

class MainScaffoldScreen extends StatefulWidget {
  @override
  _MainScaffoldScreenState createState() => _MainScaffoldScreenState();
}

class _MainScaffoldScreenState extends State<MainScaffoldScreen> {
  final controller = MainScaffoldController();

  @override
  Widget build(BuildContext context) {
    List lisPages = [
      () => HomeScreen(),
      ()=>SearchScreen(),
      ()=>ChatScreen(),
      ()=>ProfileScreen()
    ];

    return SafeArea(
      child: Scaffold(
//        appBar: AppBarMenu(
//          firstIcon: Icons.location_on,
//          onPressedFirstIcon: (){},
//          secondIcon: Icons.chat,
//          onPressedSecondIcon: (){},
//          colorIcons: primaryColor,
//        ),
          body: Observer(
              builder:(_){
                return lisPages[controller.selectedIndex]();
              }
          ),
          bottomNavigationBar: CustomBottomBar(controller)
      ),
    );
  }
}
