import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sakambuik/componen/background.dart';
import 'package:sakambuik/constant.dart';
import 'package:sakambuik/model/M_umkm.dart';
import 'package:sakambuik/model/delete_produk.dart';
import 'package:sakambuik/umkm/produkUmkm/InsertProduk.dart/componen/body.dart';
import 'package:sakambuik/umkm/produkUmkm/UpdateProduk.dart/UpdateProdukScreen.dart';

class BodyProdukUmkm extends StatefulWidget {
  final String id;
  const BodyProdukUmkm({Key key, this.id}) : super(key: key);

  @override
  _BodyProdukUmkmState createState() => _BodyProdukUmkmState();
}

class _BodyProdukUmkmState extends State<BodyProdukUmkm> {
  DeleteProduk deleteprdk = null;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      judul: "Produk UMKM Umum",
      child: Stack(
        children: [
          Positioned(
            left: size.width * 0.05,
            right: size.width * 0.05,
            top: size.height * 0.25,
            child: Column(
              children: [
                Container(
                  // color: BlueSambuik,
                  // margin: EdgeInsets.only(
                  //   left: size.width * 0.05,
                  //   right: size.width * 0.05,
                  //   top: size.height * 0.25,
                  // ),
                  height: size.height * 0.68,
                  child: FutureBuilder(
                    future: fetechUMKM(widget.id),
                    builder: (context, data) {
                      if (data.hasError) {
                        return Center(child: Text("${data.error}"));
                      } else if (data.hasData) {
                        var itemUmkm = data.data as List<UMKM>;
                        return ListView.builder(
                            itemCount: itemUmkm == null ? 0 : itemUmkm.length,
                            itemBuilder: (context, index) {
                              return Card(
                                  color: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.amber, width: 3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                  ),
                                  elevation: 5,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 6),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          right: 80,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons
                                                  .drive_file_rename_outline_outlined,
                                              color: Colors.green,
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          UpdateProdukScreen(deskripsi:itemUmkm[index].deskripsi,)));
                                              ;
                                            },
                                          )),
                                      Positioned(
                                        right: 0,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.minimize_outlined,
                                          ),
                                          onPressed: () {
                                            Widget NoButton = TextButton(
                                              child: Text("NO"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                // new BodyProdukUmkm();
                                              },
                                            );
                                            Widget YesButton = TextButton(
                                              child: Text("Yes"),
                                              onPressed: () {
                                                setState(() {
                                                  DeleteProduk.connectToApi(
                                                          itemUmkm[index]
                                                              .id_produk)
                                                      .then((value) => {
                                                            deleteprdk = value,
                                                            if (deleteprdk !=
                                                                null)
                                                              {
                                                                if (deleteprdk
                                                                        .kode ==
                                                                    1)
                                                                  {
                                                                    new BodyProdukUmkm()
                                                                  }
                                                              }
                                                          });
                                                });
                                                Navigator.of(context).pop();
                                              },
                                            );
                                            AlertDialog alert = AlertDialog(
                                              title: Text("Peringatan"),
                                              content: Text(
                                                  "Apakah Anda Ingin Menghapus Produk Ini??"),
                                              actions: [NoButton, YesButton],
                                            );
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return alert;
                                              },
                                            );
                                            // showAlertDIalog(context);
                                          },
                                        ),
                                      ),
                                      Positioned(
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          child: Row(children: <Widget>[
                                            Expanded(
                                              flex: 3,
                                              child: Container(
                                                color: Colors.grey,
                                                width: 100,
                                                height: 150,
                                                // child: Image.network(
                                                //   itemUmkm[index].foto_produk ==
                                                //           ""
                                                //       ? api + "img/null.png"
                                                //       : api +
                                                //           "img/" +
                                                //           itemUmkm[index]
                                                //               .foto_produk,
                                                //   fit: BoxFit.cover,
                                                // ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 7,
                                              child: Container(
                                                padding: EdgeInsets.all(5),
                                                // height: 135,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      itemUmkm[index].deskripsi,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      children: <Widget>[
                                                        Text("Nama Produk :"),
                                                        Text(itemUmkm[index]
                                                            .nama_produk)
                                                      ],
                                                    ),
                                                    Row(
                                                      children: <Widget>[
                                                        Text("Komposisi :"),
                                                        Text(itemUmkm[index]
                                                            .komposisi)
                                                      ],
                                                    ),
                                                    Row(
                                                      children: <Widget>[
                                                        Text("Kategori :"),
                                                        Text(itemUmkm[index]
                                                            .kategori)
                                                      ],
                                                    ),
                                                    Row(
                                                      children: <Widget>[
                                                        Text("Stok :"),
                                                        Text(itemUmkm[index]
                                                            .stok)
                                                      ],
                                                    ),
                                                    Row(
                                                      children: <Widget>[
                                                        Text("Tgl Buat :"),
                                                        Text(itemUmkm[index]
                                                            .tgl_buat)
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ]),
                                        ),
                                      ),
                                    ],
                                  ));
                            });
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

showAlertDIalog(BuildContext context) {
  // Widget remindButton = TextButton(
  //   child: Text("Remind me later"),
  //   onPressed:  () {},
  // );
}
