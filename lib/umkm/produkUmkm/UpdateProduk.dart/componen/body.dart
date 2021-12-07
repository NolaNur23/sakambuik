import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sakambuik/componen/InputDeco_design.dart';
import 'package:sakambuik/componen/background.dart';
import 'package:sakambuik/componen/rounded_input_field.dart';
import 'package:sakambuik/componen/text_field_container.dart';
import 'package:sakambuik/constant.dart';
import 'package:sakambuik/model/InsertProduk.dart';

class BodyUpdateProduk extends StatefulWidget {
  String id, deskripsi;
  BodyUpdateProduk({Key key, this.id, this.deskripsi}) : super(key: key);

  @override
  _BodyUpdateProdukState createState() => _BodyUpdateProdukState();
}

class _BodyUpdateProdukState extends State<BodyUpdateProduk> {
  TextEditingController _namaproduk = TextEditingController();
  TextEditingController _deskripsi = TextEditingController();
  TextEditingController _komposisi = TextEditingController();
  TextEditingController _satuan = TextEditingController();
  TextEditingController _stok = TextEditingController();
  TextEditingController _kemampuanmembuat = TextEditingController();
  TextEditingController _waktupembuatan = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String id_kategori,
      produk,
      komposisi,
      satuan,
      // deskripsi,
      tgl_stok,
      id_umkm,
      id_produk;
  String _valuekategoriPrd, kategoriPrd;
  String kemampuan, stok, daya_buat, waktu_buat;
  int _valkategoriPrdint;
  // _namaproduk.text = widget.deskripsi;

  @override
  Widget build(BuildContext context) {
    List<String> spinJenisKategori = ['Handy Crafy', 'Kuliner', 'Perangkat'];

    Size size = MediaQuery.of(context).size;
    return Background(
      judul: "Update Produk",
      child: Container(
          // color: BlueSambuik,
          margin: EdgeInsets.only(
              left: size.width * 0.1,
              right: size.width * 0.1,
              top: size.height * 0.25,
              bottom: size.height * 0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3))
              ]),
          height: size.height * 0.68,
          child: SingleChildScrollView(
              child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      Material(
                        child: RoundedInputField(
                          editInput: _namaproduk,
                          onChange: (value) {
                            _namaproduk.text = value;
                          },
                          // isi: widget.deskripsi,
                          cursorColor: BlueSambuik,
                          // inDecoration:
                          //     buildInputDecoration(Icons.person, "Nama Produk"),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Masukkan Nama Produk';
                            }
                            return null;
                          },
                        ),
                      ),
                      Material(
                        // shape: BorderDirectional(),
                        child: TextFieldContainer(
                          child: Container(
                            child: DropdownButton(
                              value: _valuekategoriPrd,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                              ),
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: BlueSambuik,
                              ),
                              hint: const Text("pilih Ketegori"),
                              isExpanded: true,
                              items: spinJenisKategori.map((valuea) {
                                return DropdownMenuItem<String>(
                                  child: Text(valuea),
                                  value: valuea,
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _valuekategoriPrd = value;
                                  _valkategoriPrdint =
                                      spinJenisKategori.indexOf(value);
                                  if (_valkategoriPrdint == 1) {
                                    id_kategori = "12321";
                                  } else if (_valkategoriPrdint == 1) {
                                    id_kategori = "124221";
                                  } else if (_valkategoriPrdint == 2) {
                                    id_kategori = "31234";
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Material(
                        child: RoundedInputField(
                          editInput: _komposisi,
                          onChange: (value) {
                            _komposisi.text = value;
                          },
                          cursorColor: BlueSambuik,
                          inDecoration: buildInputDecoration(
                              Icons.person, "Komposisi Produk"),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Masukkan Komposisi Produk';
                            }
                            return null;
                          },
                        ),
                      ),
                      Material(
                        child: RoundedInputField(
                          editInput: _deskripsi,
                          onChange: (value) {
                            _deskripsi.text = value;
                          },
                          // isi: "hai",
                          cursorColor: BlueSambuik,
                          inDecoration: buildInputDecoration(
                              Icons.person, "Deskripsi Produk"),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Masukkan Deskripsi Produk';
                            }
                            return null;
                          },
                        ),
                      ),
                      Material(
                        child: RoundedInputField(
                          editInput: _kemampuanmembuat,
                          onChange: (value) {
                            _kemampuanmembuat.text = value;
                          },
                          cursorColor: BlueSambuik,
                          inDecoration: buildInputDecoration(
                              Icons.person, "Jumlah Buat Produk"),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Masukkan Jumlah Buat Produk';
                            }
                            return null;
                          },
                        ),
                      ),
                      Material(
                        child: RoundedInputField(
                          editInput: _satuan,
                          onChange: (value) {
                            _satuan.text = value;
                          },
                          cursorColor: BlueSambuik,
                          inDecoration: buildInputDecoration(
                              Icons.person, "Satuan Jumlah Buat Produk"),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Satuan Jumlah Buat Produk';
                            }
                            return null;
                          },
                        ),
                      ),
                      Material(
                        child: RoundedInputField(
                          editInput: _satuan,
                          onChange: (value) {
                            _waktupembuatan.text = value;
                          },
                          cursorColor: BlueSambuik,
                          inDecoration: buildInputDecoration(
                              Icons.person, "Waktu Buat Produk/hari"),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Masukkan Waktu Buat Produk/hari';
                            }
                            return null;
                          },
                        ),
                      ),
                      FlatButton(
                          child: Text("Update"),
                          // text: "Simpan",
                          onPressed: () {
                            if (_formkey.currentState.validate()) {
                              produk = _namaproduk.text;
                              komposisi = _komposisi.text;
                              satuan = _satuan.text;
                              waktu_buat = _waktupembuatan.text;
                              // deskripsi = _deskripsi.text;
                              stok = "0";
                              tgl_stok = "0000-00-00";
                              daya_buat = _kemampuanmembuat.text;

                              //   InsertProduk.connectToApi(
                              //     id_produk,
                              //     widget.id,
                              //     produk,
                              //     id_kategori,
                              //     komposisi,
                              //     int.parse(daya_buat),
                              //     satuan,
                              //     int.parse(waktu_buat),
                              //     stok,
                              //     tgl_stok,
                              //     "2021-12-01",
                              //     // deskripsi,
                              //   ).then((value) {});
                            }
                            setState(() {});
                          })
                    ],
                  )))),
    );
  }
}
