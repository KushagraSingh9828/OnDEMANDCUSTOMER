import 'dart:async';
import 'package:flutter/material.dart';
import 'package:odsa/helpers/colors.dart';
import 'package:odsa/screens/Dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _prefs = SharedPreferences.getInstance();
  bool isLogin = false;
  checkLogin() async {
    SharedPreferences prefs = await _prefs;
    var login = prefs.getBool('isLogin');
    if (login != null) {
      setState(() {
        isLogin = login;
      });
    } else {
      setState(() {
        isLogin = false;
      });
    }
    Timer(
        Duration(seconds: 3),
        () => isLogin
            ? Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const BottomNavBar()),
                (route) => false)
            : Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const SignIn()),
                (route) => false));
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

// context, MaterialPageRoute(builder: (context) => const SignIn())
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                darkPrimary,
                lightPrimary,
              ]),
        ),
        child: Center(
          child: Container(width: 312.04,
              height: 98.42,
              child: Image.asset("assets1/svg/logo.png")),
        ),
      ),
    );
  }
}
