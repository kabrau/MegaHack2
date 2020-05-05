import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megahackapp/app/models/user_model.dart';
import 'package:megahackapp/app/screens/profile/profile_repository.dart';
import 'package:megahackapp/app/screens/splash/splash_screen.dart';
import 'package:megahackapp/app/shared/utils/shared_prefs.dart';
import 'package:mobx/mobx.dart';

part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  final repository = ProfileRepository();

  @observable
  bool loading;
  @observable
  User user;

  User _user = User();
  @action
  getCurrentUser(context) async{
    loading = true;
    var userTeste = await _user.get();
    loading = false;
    if(!loading && userTeste ==null){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
          builder: (context) => SplashScreen()),(Route<dynamic> route) => false);
    } else user = userTeste;
  }
  logout(){
    SharedPrefs.remove("user");
    SharedPrefs.setBool("isLogged", false);
  }
}
