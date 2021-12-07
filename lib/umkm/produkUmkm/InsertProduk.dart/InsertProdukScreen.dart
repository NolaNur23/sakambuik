import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sakambuik/umkm/produkUmkm/InsertProduk.dart/componen/body.dart';

class InsertProdukScreen extends StatelessWidget {
  final String id;
  const InsertProdukScreen({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: BodyTambahProduk(
        id: id,
      ),
    );
  }
}
