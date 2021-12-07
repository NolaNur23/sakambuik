import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sakambuik/componen/background.dart';
import 'package:sakambuik/constant.dart';
import 'package:sakambuik/model/produk.dart';

class BodyTawaranUmkm extends StatefulWidget {
  const BodyTawaranUmkm({Key key}) : super(key: key);

  @override
  _BodyTawaranUmkmState createState() => _BodyTawaranUmkmState();
}

class _BodyTawaranUmkmState extends State<BodyTawaranUmkm> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      judul: "Tawaran UMKM Umum",
      child: Container(
        // color: BlueSambuik,
        margin: EdgeInsets.only(
          left: size.width * 0.05,
          right: size.width * 0.05,
          top: size.height * 0.25,
        ),
        height: size.height * 0.68,
      ),
    );
  }
}
