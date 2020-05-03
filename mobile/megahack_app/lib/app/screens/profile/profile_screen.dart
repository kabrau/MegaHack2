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
      appBar: AppBar(
        backgroundColor: blankColor,
        title: Text("Perfil", style: TextStyle(color: blackColor),),
        centerTitle: true,
      ),
      body: Container(
        child: Observer(
          builder: (_){
            if(controller.user != null && controller.user.value != null){
            var user = controller.user.value;
            return ListView(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: user.urlAvatar != null ?
                              NetworkImage("http://equipe28.azurewebsites.net/images/${user.urlAvatar}") :
                              AssetImage("assets/images/person_avatar.png"),
                              fit: BoxFit.cover
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(user.name ?? "",
                              style: TextStyle(
                                  fontSize: 18, color: blackColor,
                                  fontWeight: FontWeight.w700)),
                          Text(user.lastupdateDate ?? "",
                              style: TextStyle(
                                  fontSize: 18, color: blackColor))
                        ],
                      ),
                    ),
                    Card(
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text("Gerenciar Conta"),
                        ),
                      ),
                    )
                  ],
                )
              ],
            );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        )
      ),
    );
  }
}