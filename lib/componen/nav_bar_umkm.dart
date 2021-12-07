import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sakambuik/componen/navbar_key.dart';
import 'package:sakambuik/constant.dart';
import 'package:sakambuik/umkm/produkUmkm/InsertProduk.dart/InsertProdukScreen.dart';
import 'package:sakambuik/umkm/produkUmkm/produkUmkmScreen.dart';
import 'package:sakambuik/umkm/tawaranUmkm/tawaranUmkmScreen.dart';

class PageNavBarUmkm extends StatefulWidget {
  final String id;
  // final List<String> namaProdukUmkm;
  const PageNavBarUmkm({Key key, this.id}) : super(key: key);

  @override
  _PageNavBarUmkmState createState() => _PageNavBarUmkmState();
}

class _PageNavBarUmkmState extends State<PageNavBarUmkm> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> listPage = [
      ProdukUkmkmScreen(
        id: widget.id,
      ),
      InsertProdukScreen(
          id: widget.id,
      ),
      const TawaranUkmkmScreen()
    ];
    //  String kode = widget.id;
    return Scaffold(
      body: listPage[page],
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
        key: NavBarKey.getKeyUmkm(),
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
