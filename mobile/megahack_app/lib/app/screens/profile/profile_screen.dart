import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:megahackapp/app/screens/profile/profile_controller.dart';
import 'package:megahackapp/app/shared/constants.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final controller = ProfileController();

  @override
  Widget build(BuildContext context) {
    controller.getCurrentUser();
    return Scaffold(
        body: Container(
            child: ListView(
      children: <Widget>[
        Observer(builder: (_) {
          if (controller.user != null && controller.user.value != null) {
            var user = controller.user.value;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 109.0,
                  height: 109.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: user.urlAvatar != null
                              ? NetworkImage(
                                  "http://equipe28.azurewebsites.net/images/${user.urlAvatar}")
                              : AssetImage("assets/images/person_avatar.png"),
                          fit: BoxFit.cover)),
                ),
                Padding(
                  padding: EdgeInsets.all(17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(user.name ?? "",
                          style: TextStyle(
                              fontSize: 18,
                              color: blackColor,
                              fontWeight: FontWeight.w700)),
                      Text(user.lastupdateDate ?? "",
                          style: TextStyle(fontSize: 18, color: blackColor))
                    ],
                  ),
                ),
              ],
            );
          }
          return Container(
            height: 185,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: <Widget>[
                cardWidget(
                    Icons.add_circle, primaryColor, "Gerenciar minha conta"),
                cardWidget(
                    Icons.settings, primaryColor, "Gerenciar minha conta"),
                cardWidget(Icons.exit_to_app, Color(0xffBD1E1E),
                    "Gerenciar minha conta"),
              ],
            ))
      ],
    )));
  }

  Card cardWidget(IconData icon, color, text) {
    return Card(
        margin: EdgeInsets.only(bottom: 15),
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(18))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        icon,
                        color: color,
                        size: 30,
                      ),
                      Text("  $text",
                          style: TextStyle(
                              fontSize: 14,
                              color: blackColor,
                              fontFamily: "AvenirLTStd Light")),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
