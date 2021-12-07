import 'package:flutter/material.dart';
import 'package:sakambuik/model/produk.dart';

class HomeDetailDeskripsi extends StatefulWidget {
  TabController tabcontroller;
  Produk produk;
  HomeDetailDeskripsi(this.tabcontroller, this.produk);

  @override
  _HomeDetailDeskripsiState createState() => _HomeDetailDeskripsiState();
}

class _HomeDetailDeskripsiState extends State<HomeDetailDeskripsi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.produk.nama,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                fontFamily: 'Ubuntu',
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              widget.produk.deskripsi,
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Ubuntu',
                color: Colors.black,
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Komposisi",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                fontFamily: 'Ubuntu',
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              widget.produk.komposisi,
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Ubuntu',
                color: Colors.black,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Kemampuan membuat',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                fontFamily: 'Ubuntu',
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              widget.produk.kemampuan_buat,
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Ubuntu',
                color: Colors.black,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Kategori',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                fontFamily: 'Ubuntu',
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              widget.produk.kategori,
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Ubuntu',
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
