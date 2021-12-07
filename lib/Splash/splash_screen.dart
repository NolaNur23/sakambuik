import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sakambuik/Splash/boarding_screen.dart';
import 'package:sakambuik/constant.dart';

class PageSplashScreen extends StatefulWidget {
  const PageSplashScreen({Key key}) : super(key: key);

  @override
  _PageSplashScreenState createState() => _PageSplashScreenState();
}

class _PageSplashScreenState extends State<PageSplashScreen> {
  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const PageOnBoardingScreen()));
    });
  }

  @override
  void initState() {
    startSplashScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BlueSambuik,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'img/logo_sakambuik.png',
                  height: 100,
                  width: 100,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
