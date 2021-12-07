import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sakambuik/Home/homeScreen.dart';
import 'package:sakambuik/berita/home_berita.dart';
import 'package:sakambuik/componen/navbar_key.dart';
import 'package:sakambuik/constant.dart';
import 'package:sakambuik/login/login_screen.dart';

class PageNavBottomBar extends StatefulWidget {
  const PageNavBottomBar({Key key}) : super(key: key);

  @override
  _PageNavBottomBarState createState() => _PageNavBottomBarState();
}

class _PageNavBottomBarState extends State<PageNavBottomBar> {
  int page = 0;

  final List<Widget> _listPage = [HomeScreen(), HomeBerita(), LoginScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listPage[page],
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        backgroundColor: Colors.white70.withOpacity(0.0),
        color: BlueSambuik,
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
        animationCurve: Curves.easeInBack,
        animationDuration: const Duration(milliseconds: 300),
        index: page,
        key: NavBarKey.getKey(),
        buttonBackgroundColor: Colors.amber,
        items: [
          Icon(Icons.home, size: 25),
          Icon(Icons.location_searching, size: 25),
          Icon(Icons.person_outline_rounded, size: 25),
        ],
      ),
    );
  }

  void Tap(int value) {
    setState(() {
      page = value;
    });
  }
}
