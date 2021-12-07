import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sakambuik/beranda/beranda.dart';
import 'package:sakambuik/componen/background.dart';
import 'package:sakambuik/componen/rounded_button.dart';
import 'package:sakambuik/constant.dart';
import 'package:sakambuik/model/Produsen.dart';
import 'package:sakambuik/produsen/ProfileProdusen/componen/bodyEdit.dart';

class Body extends StatefulWidget {
  final String username;
  // final List<String> data;
  final String namaProdusen;
  final String pemilik;
  final String legalitas;
  final String kontak;
  final String alamat;
  final String fotoProdusen;
  const Body(
      {Key key,
      this.username,
      this.namaProdusen,
      this.kontak,
      this.alamat,
      this.pemilik,
      this.fotoProdusen,
      this.legalitas})
      : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  // Produsen produsen = null;
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Background(
        judul: '',
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 4,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.0),
                  image: DecorationImage(
                    image: NetworkImage(widget.fotoProdusen == ""
                        ? api + "img/null.png"
                        : api + "img/" + widget.fotoProdusen),
                    fit: BoxFit.cover,
                  ),
                ),
                margin: EdgeInsets.only(top: size.height * 0.1),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: [
                        Text(
                          "Produsen",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.username,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                )),
            SizedBox(
              height: 30,
            ),
            Flexible(
              flex: 8,
              child: Container(
                // width: size.width,
                // alignment: Alignment.topLeft,

                margin: EdgeInsets.only(
                  left: size.width * 0.1,
                  right: size.width * 0.1,
                ),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3))
                    ]),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "USERNAME",
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.username,
                                style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Nama Pemilik",
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.namaProdusen,
                                style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Legalitas Usaha",
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.legalitas,
                                style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Telepon",
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.kontak,
                                style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Alamat",
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.alamat,
                                style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.end,
                          //   children: [
                          //     RaisedButton(
                          //       padding: EdgeInsets.symmetric(horizontal: 60),
                          //       onPressed: () {},
                          //       color: Colors.amber,
                          //       shape: RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(10)),
                          //       child: Text("Click This"),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      height: 80,
                      child: RaisedButton(
                        // padding: EdgeInsets.symmetric(horizontal: 60),
                        onPressed: () {
                          // Produsen.connectToApiProdusen('').then((value) {
                          //   produsen = value;
                          //   if (produsen != null) {
                          //     if (produsen.data == 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const BodyEdit();
                              },
                            ),
                          );
                          //     }
                          //   }
                          // });
                        },
                        color: BlueSambuik,

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(mainAxisSize: MainAxisSize.min,

                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new Icon(
                                Icons.system_update_alt_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Update Data",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ))
                            ]),
                      ),
                    ),
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
