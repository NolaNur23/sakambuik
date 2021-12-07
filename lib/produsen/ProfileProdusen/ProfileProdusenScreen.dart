import 'package:flutter/material.dart';
import 'package:sakambuik/produsen/ProfileProdusen/componen/body.dart';

class ProfileProdusenScreen extends StatelessWidget {
  final String username;
  final String namaProdusen;
  final String pemilik;
  final String legalitas;
  final String kontak;
  final String alamat;
  final String fotoProdusen;
  // final List<String> data;
  ProfileProdusenScreen({Key key, this.username, this.namaProdusen, this.kontak, this.alamat, this.pemilik, this.fotoProdusen,this.legalitas}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        username: username,
        namaProdusen: namaProdusen,
        pemilik: pemilik,
        legalitas: legalitas,
        kontak: kontak,
        alamat: alamat,
        fotoProdusen: fotoProdusen,
        // data: data,
      ),
    );
  }
}
