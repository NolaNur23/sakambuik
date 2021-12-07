import 'package:flutter/material.dart';
import 'package:sakambuik/Splash/boarding_screen.dart';
import 'package:sakambuik/Splash/splash_screen.dart';
import 'package:sakambuik/login/login_screen.dart';
import 'package:sakambuik/produsen/HomeProdusen/homeProdusenScreen.dart';
import 'package:sakambuik/produsen/ProfileProdusen/ProfileProdusenScreen.dart';
import 'package:sakambuik/umkm/produkUmkm/InsertProduk.dart/componen/body.dart';
import 'package:sakambuik/umkm/produkUmkm/produkUmkmScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sakambuik',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageOnBoardingScreen(),
    );
  }
}
