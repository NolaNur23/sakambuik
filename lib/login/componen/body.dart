import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sakambuik/componen/InputDeco_design.dart';
import 'package:sakambuik/componen/already_have_an_account_acheck.dart';
import 'package:sakambuik/componen/nav_bar_umkm.dart';
import 'package:sakambuik/componen/rounded_button.dart';
import 'package:sakambuik/componen/rounded_input_field.dart';
import 'package:sakambuik/constant.dart';
import 'package:sakambuik/model/Produsen.dart';
import 'package:sakambuik/model/User.dart';
import 'package:sakambuik/componen/background.dart';
import 'package:sakambuik/produsen/ProfileProdusen/ProfileProdusenScreen.dart';
import 'package:sakambuik/signup/signup_screen.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _bodyState createState() => _bodyState();
}

class _bodyState extends State<Body> {
  FToast fToast;
  String usernameProdusen,
      namaProdusen,
      pemilik,
      legalitas,
      kontak,
      alamat,
      fotoProdusen,
      id;
  List<String> namaProdukUmkm;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool hide = true;
  User user = null;
  Produsen produsen = null;
  // UMKM umkm = null;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    // var items = List<Produsen.>;
    return Background(
      judul: "LOGIN USER",
      child: Container(
        margin: EdgeInsets.only(
            left: size.width * 0.05,
            right: size.width * 0.05,
            top: size.height * 0.25,
            bottom: size.height * 0),
        padding: const EdgeInsets.all(5),
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
                SizedBox(height: size.height * 0),
                Image.asset(
                  "img/logo_sakambuik.png",
                  height: size.height * 0.3,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                RoundedInputField(
                  editInput: usernameController,
                  cursorColor: BlueSambuik,
                  inDecoration: buildInputDecoration(Icons.person, "Username"),
                  onChange: (value) {
                    usernameController.text = value;
                  },
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Masukkan Username';
                    }
                    return null;
                  },
                ),
                RoundedInputField(
                  editInput: passwordController,
                  hide: true,
                  onChange: (value) {
                    passwordController.text = value;
                  },
                  cursorColor: BlueSambuik,
                  inDecoration: buildInputDecoration(Icons.lock, "Password"),
                  validator: (String value) {
                    if (value.isEmpty) return 'pasword kosong';
                  },
                ),
                RoundedButton(
                    text: "LOGIN",
                    press: () {
                      if (_formkey.currentState.validate()) {
                        User.connectToApi(usernameController.text,
                                passwordController.text)
                            .then((value) {
                          user = value;
                          if (user != null) {
                            if (user.Kode == 1) {
                              if (user.data.id_level == "2") {
                                id = user.id;
                                Produsen.connectToApiProdusen(id).then((value) {
                                  produsen = value;
                                  if (produsen != null) {
                                    usernameProdusen = produsen.data.username;
                                    alamat = produsen.data.alamat;
                                    fotoProdusen = produsen.data.foto_produsen;
                                    kontak = produsen.data.kontak;
                                    legalitas = produsen.data.legalitas;
                                    namaProdusen = produsen.data.produsen;
                                    pemilik = produsen.data.pemilik;
                                    // data = produsen.data as List<String>;

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return ProfileProdusenScreen(
                                            username: usernameProdusen,
                                            alamat: alamat,
                                            fotoProdusen: fotoProdusen,
                                            kontak: kontak,
                                            legalitas: legalitas,
                                            namaProdusen: namaProdusen,
                                            pemilik: pemilik,
                                          );
                                        },
                                      ),
                                    );
                                  }
                                });
                                //masuk ke bagian produsen

                              } else if (user.data.id_level == "412") {
                                // //masuk ke bagian umkm
                                // id = user.id;
                                // UMKM.connectToApiUMKM(id).then((value) {
                                //   umkm = value;
                                //   if (umkm != null) {

                                //     // data = produse
                                id = user.id;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return PageNavBarUmkm(
                                        id: id,
                                          );
                                    },
                                  ),
                                );
                                //   } else {
                                //     Widget toast = Container(
                                //       padding: const EdgeInsets.symmetric(
                                //           horizontal: 24.0, vertical: 12.0),
                                //       decoration: BoxDecoration(
                                //         borderRadius:
                                //             BorderRadius.circular(25.0),
                                //         color: Colors.redAccent,
                                //       ),
                                //       child: Row(
                                //         mainAxisSize: MainAxisSize.min,
                                //         children: [
                                //           Icon(Icons.warning),
                                //           SizedBox(
                                //             width: 12.0,
                                //           ),
                                //           Text("Tampilan "),
                                //         ],
                                //       ),
                                //     );
                                //     fToast.showToast(
                                //         child: toast,
                                //         toastDuration: Duration(seconds: 3));
                                //   }
                                // });
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
                                      Text("Tampilan pengguna belum tersedia"),
                                    ],
                                  ),
                                );
                                fToast.showToast(
                                    child: toast,
                                    toastDuration: Duration(seconds: 3));
                              }
                            } else if (user.Kode == 0) {
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
                                    Text(user.Pesan),
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
                    }),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpScreen();
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: size.height * 0.01),
              ],
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
