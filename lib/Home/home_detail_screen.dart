import 'package:flutter/material.dart';
import 'package:sakambuik/componen/background.dart';
import 'package:sakambuik/Home/home_detail_deskripsi.dart';
import 'package:sakambuik/Home/home_detail_lokasi.dart';
import 'package:sakambuik/constant.dart';
import 'package:sakambuik/model/produk.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeDetailScreen extends StatefulWidget {
  final Produk produk;
  const HomeDetailScreen({Key key, this.produk}) : super(key: key);

  @override
  _HomeDetailScreenState createState() => _HomeDetailScreenState();
  void launchWhatsApp({number, message}) async {
    String url = "whatsapp://send?phone=$number&text=$message";
    await canLaunch(url) ? launch(url) : print("Tidak bisa membuka Wa");
  }
}

class _HomeDetailScreenState extends State<HomeDetailScreen>
    with SingleTickerProviderStateMixin {
  var isChanged = true;
  bool changed = true;
  TabController tabcontroll;
  // var data=pro

  @override
  void initState() {
    tabcontroll = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabcontroll?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        judul: "Detail",
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: Stack(
                children: [
                  Positioned(
                    // right: 0,
                    // left: 0,

                    child: FlatButton(
                      onPressed: () {
                        setState(() => isChanged = !isChanged);
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        height:
                            isChanged ? size.height * 0.4 : size.height * 0.7,
                        width: size.width,
                        child: Image.network(
                          widget.produk.gambar_produk == ""
                              ? api + "img/null.png"
                              : api + "img/" + widget.produk.gambar_produk,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 3,
                    right: 10,
                    child: FloatingActionButton(
                      backgroundColor: Colors.white.withOpacity(0),
                      splashColor: BlueSambuik,
                      onPressed: () {
                        widget.launchWhatsApp(
                            number: "62" + widget.produk.telp,
                            message: " Hai " +
                                widget.produk.nama +
                                "\nApakah produk " +
                                widget.produk.produk +
                                " Masih ada?");
                      },
                      child: Image.asset(
                        "img/wa.png",
                        height: 50,
                        width: 50,

                        // color: Colors.green,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))
                  //more than 50% of width makes circle
                  ),
              child: TabBar(
                controller: tabcontroll,
                tabs: [
                  Tab(
                    child: Text(
                      'Deskripsi',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Ubuntu',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Lokasi',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Ubuntu',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: TabBarView(
                  controller: tabcontroll,
                  children: [
                    HomeDetailDeskripsi(tabcontroll, widget.produk),
                    HomeLokasi(tabcontroll, widget.produk),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
