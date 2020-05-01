import 'package:flutter/material.dart';
import 'package:megahackapp/app/screens/login/login_screen.dart';
import 'package:megahackapp/app/shared/constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    // TODO: implement initState
    redirectPage();
    super.initState();
  }
  void redirectPage(){
    Future.delayed(Duration(seconds: 4)).then((v) async{
      Navigator.push(context, MaterialPageRoute
        (builder: (context) => LoginScreen()),
      );
//      bool _isLogged = await SharedPrefs.getBool('isLogged');
//      bool _companyLogged = await SharedPrefs.getBool('companyLogged');

    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor
    );
  }
}
