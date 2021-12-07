import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sakambuik/componen/background.dart';
import 'package:sakambuik/Home/home_detail_screen.dart';
import 'package:sakambuik/model/produk.dart';
import 'package:sakambuik/constant.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      judul: "List Produk",
      child: Container(
        // color: BlueSambuik,
        margin: EdgeInsets.only(
            left: size.width * 0.05,
            right: size.width * 0.05,
            top: size.height * 0.25,
            bottom: size.height * 0),
        height: size.height * 0.7,
        child: FutureBuilder(
          future: fetechProduk(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text("${data.error}"));
            } else if (data.hasData) {
              var items = data.data as List<Produk>;
              return ListView.builder(
                  itemCount: items == null ? 0 : items.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      // Size sizea = MediaQuery.of(Card).size;
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.amber, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            child: Container(
                              color: Colors.grey,
                              width: size.width,
                              height: 135,
                              child: Image.network(
                                items[index].gambar_produk == ""
                                    ? api + "img/null.png"
                                    : api + "img/" + items[index].gambar_produk,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 15,
                            left: 20,
                            // right: size.width * 0.5,
                            child: Text(
                              items[index].produk,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            right: 5,
                            child: Container(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeDetailScreen(
                                                    produk: items[index])));
                                  },
                                  child: Text(
                                    "Selengkapnya>>",
                                    // textAlign: ,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      // Expanded(
                      //   flex: 7,
                      //   child: Container(
                      //     // color: Colors.amber,
                      //     padding: EdgeInsets.all(5),
                      //     height: 180,
                      //     child: Column(
                      //       crossAxisAlignment:
                      //           CrossAxisAlignment.start,
                      //       children: <Widget>[

                      //         SizedBox(
                      //           height: 5,
                      //         ),

                      //       ],
                      //     ),
                      //   ),
                      // )
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
