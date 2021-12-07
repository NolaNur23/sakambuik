import 'package:flutter/material.dart';
import 'package:sakambuik/umkm/produkUmkm/componen/body.dart';

class ProdukUkmkmScreen extends StatelessWidget {
  final String id;
  const ProdukUkmkmScreen({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 String kode = id;
    return  Scaffold(
      body: BodyProdukUmkm(
        id: kode,
      ),
    );
  }
}
