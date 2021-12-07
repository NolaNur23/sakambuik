import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sakambuik/umkm/produkUmkm/InsertProduk.dart/componen/body.dart';
import 'package:sakambuik/umkm/produkUmkm/UpdateProduk.dart/componen/body.dart';

class UpdateProdukScreen extends StatelessWidget {
   String id,deskripsi;
  UpdateProdukScreen({Key key, this.id,this.deskripsi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: BodyUpdateProduk(
        id: id,
        deskripsi: deskripsi,
      ),
    );
  }
}
