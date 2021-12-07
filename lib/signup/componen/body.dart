// ignore_for_file: void_checks
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:sakambuik/beranda.dart';
import 'package:sakambuik/componen/InputDeco_design.dart';
import 'package:sakambuik/componen/rounded_button.dart';
import 'package:sakambuik/componen/rounded_input_field.dart';
import 'package:sakambuik/model/registrasi.dart';
import 'package:sakambuik/componen/background.dart';
import 'package:sakambuik/constant.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FToast fToast;
  String jenis;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String dropdownValue = 'UMKM Umum';
  List<String> spinJenisUser = ['UMKM Umum', 'Produsen'];
  Register register = null;

  final TextEditingController pass = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();
  // final TextEditingController _jenisUser = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _namaUsaha = TextEditingController();
  // final TextEditingController _kateg = TextEditingController();
  final TextEditingController _namaPemilik = TextEditingController();
  // final TextEditingController _jenisUsaha = TextEditingController();
  // final TextEditingController _sektor = TextEditingController();
  final TextEditingController _legalitas = TextEditingController();
  final TextEditingController _telepon = TextEditingController();
  final TextEditingController _alamat = TextEditingController();
  String _valueJenis;
  int _valJenisint;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    var tahun = DateFormat('yyy').format(DateTime.now());
    Random random = Random();
    int r = random.nextInt(999999999) + 100000000;
    String idKoperasi = "UMKM-" + tahun + r.toString() + r.toString();
    String idprodusen = "PD-" + tahun + r.toString() + r.toString();
    Size size = MediaQuery.of(context).size;
    List<String> _jenis = ['UMKM', 'Produsen'];

    return Background(
      judul: "Daftar Akun",
      child: Container(
        margin: EdgeInsets.only(
            left: size.width * 0.1,
            right: size.width * 0.1,
            top: size.height * 0.25,
            bottom: size.height * 0),
        padding: const EdgeInsets.all(20),
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
                DropdownButton(
                  value: _valueJenis,
                  hint: const Text("pilih jenis user"),
                  isExpanded: true,
                  items: _jenis.map((valuea) {
                    return DropdownMenuItem<String>(
                      child: Text(valuea),
                      value: valuea,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _valueJenis = value;
                      _valJenisint = _jenis.indexOf(value) + 1;
                    });
                  },
                ),
                // RoundedInputField(
                //   editInput: _jenisUser,
                //   onChange: (value) {
                //     _jenisUser.text = value;
                //   },
                //   cursorColor: BlueSambuik,
                //   inDecoration:
                //       buildInputDecoration(Icons.person, "Jenis User"),
                //   validator: (String value) {
                //     if (value.isEmpty) {
                //       return 'Please Enter Name';
                //     }
                //     return null;
                //   },
                // ),
                RoundedInputField(
                  editInput: _namaUsaha,
                  onChange: (value) {
                    _namaUsaha.text = value;
                  },
                  cursorColor: BlueSambuik,
                  inDecoration:
                      buildInputDecoration(Icons.person, "Nama Usaha"),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please Enter Nama Usaha';
                    }
                    return null;
                  },
                ),
                RoundedInputField(
                  editInput: _namaPemilik,
                  cursorColor: BlueSambuik,
                  keyType: TextInputType.name,
                  onChange: (value) {
                    _namaPemilik.text = value;
                  },
                  inDecoration:
                      buildInputDecoration(Icons.person, "Nama Pemilik"),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Masukkan Nama Pemilik';
                    }
                    return null;
                  },
                ),

                RoundedInputField(
                  editInput: _legalitas,
                  onChange: (value) {
                    _legalitas.text = value;
                  },
                  cursorColor: BlueSambuik,
                  inDecoration:
                      buildInputDecoration(Icons.person, "Legalitas Usaha"),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Masukkan Legalitas Usaha';
                    }
                    return null;
                  },
                ),
                RoundedInputField(
                  editInput: _telepon,
                  cursorColor: BlueSambuik,
                  keyType: TextInputType.phone,
                  onChange: (value) {
                    _telepon.text = value;
                  },
                  inDecoration: buildInputDecoration(Icons.person, "Telepon"),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Masukkan Nomor Telepon';
                    }
                    return null;
                  },
                ),
                RoundedInputField(
                  editInput: _alamat,
                  keyType: TextInputType.streetAddress,
                  cursorColor: BlueSambuik,
                  onChange: (value) {
                    _alamat.text = value;
                  },
                  inDecoration: buildInputDecoration(Icons.person, "Alamat"),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Masukkan Alamat';
                    }
                    return null;
                  },
                ),
                RoundedInputField(
                  editInput: _username,
                  onChange: (value) {
                    _username.text = value;
                  },
                  cursorColor: BlueSambuik,
                  inDecoration: buildInputDecoration(Icons.person, "Username"),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Masukkan Username';
                    }
                    return null;
                  },
                ),
                RoundedInputField(
                  editInput: pass,
                  hide: true,
                  onChange: (value) {
                    pass.text = value;
                  },
                  cursorColor: BlueSambuik,
                  inDecoration: buildInputDecoration(Icons.person, "Password"),
                  validator: (String value) {
                    if (value.isEmpty) return 'Empty';
                  },
                ),
                RoundedInputField(
                  editInput: confirmPass,
                  hide: true,
                  onChange: (value) {
                    confirmPass.text = value;
                  },
                  inDecoration:
                      buildInputDecoration(Icons.person, "Confirm Passwprd"),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Password kosong';
                    }
                    // ignore: avoid_print
                    print(pass.text);

                    // ignore: avoid_print
                    print(confirmPass.text);
                    if (pass.text != confirmPass.text) {
                      return "Password tidak sama";
                    }
                    return null;
                  },
                ),
                RoundedButton(
                  text: "SIGN IN",
                  press: () {
                    if (_formkey.currentState.validate()) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(content: Text('Processing Data')),
                      //   );

                      Register.connectToApi(
                              _valJenisint.toString(), //jenis
                              _namaUsaha.text, //namausaha
                              _namaPemilik.text, //nama
                              _legalitas.text,
                              _telepon.text,
                              _alamat.text,
                              _username.text,
                              pass.text,
                              idKoperasi,
                              idprodusen)
                          .then((value) {
                        register = value;
                        if (register != null) {
                          if (register.Kode == "1") {
                            Widget toast = Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: Colors.green,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                  ),
                                  SizedBox(
                                    width: 12.0,
                                  ),
                                  Text(register.pesan),
                                ],
                              ),
                            );
                            fToast.showToast(
                                child: toast,
                                toastDuration: Duration(seconds: 3));
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //     SnackBar(content: Text(register.pesan)));
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Beranda(
                            //             jenisUser: _valJenisint.toString(),
                            //             alamat: _alamat.text,
                            //             namaPemilik: _namaPemilik.text,
                            //             legalitasUsaha: _legalitas.text,
                            //             namaUsaha: _namaUsaha.text,
                            //             password: pass.text,
                            //             teleponPemilik: _telepon.text,
                            //             id_koperasi: idKoperasi,
                            //             id_produsen: idprodusen,
                            //             username: _username.text)));
                          } else {
                            Widget toast = Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: Colors.redAccent,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.warning),
                                  SizedBox(
                                    width: 12.0,
                                  ),
                                  Text(register.pesan),
                                ],
                              ),
                            );
                            fToast.showToast(
                                child: toast,
                                toastDuration: Duration(seconds: 3));
                          }
                        }
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
