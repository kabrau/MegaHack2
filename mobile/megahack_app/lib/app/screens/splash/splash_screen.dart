import 'package:flutter/material.dart';
import 'package:megahackapp/app/screens/login/login_screen.dart';
import 'package:megahackapp/app/screens/main_scaffold/main_scaffold_screen.dart';
import 'package:megahackapp/app/shared/constants.dart';
import 'package:megahackapp/app/shared/utils/shared_prefs.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    redirectPage();
    super.initState();
  }

  void redirectPage() {
    Future.delayed(Duration(seconds: 4)).then((v) async {

//      bool _isLogged = await SharedPrefs.getBool('isLogged');
//      bool _companyLogged = await SharedPrefs.getBool('companyLogged');

      bool _isLogged = await SharedPrefs.getBool('isLogged');
      if (_isLogged) {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
            builder: (context)=> MainScaffoldScreen())
            ,(Route<dynamic> route) => false);
      }
      else
        Navigator.push(context, MaterialPageRoute
          (builder: (context) => LoginScreen()),
        );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 200,
            width: 200,
            child: Image.asset(
                "assets/images/LogoAquiPerto.png"
            ),
          )
        ],
      )
    );
  }
}
