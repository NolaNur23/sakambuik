import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sakambuik/componen/background.dart';
import 'package:sakambuik/constant.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _bodyState createState() => _bodyState();
}

class _bodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      judul: "Produsen",
      child: Container(
        // color: Colors.amber,
        margin: EdgeInsets.only(
          left: size.width * 0.1,
          right: size.width * 0.1,
          top: size.height * 0.30,
        ),
        height: size.height * 0.50,
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Container(
                  height: size.height,
                  decoration: BoxDecoration(
                      color: kPrimaryLightColor,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'img/profil_produsen.png',
                        fit: BoxFit.fitHeight,
                        // alignment: Alignment.topCenter,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Image.asset(
                        'img/txtprofilpengguna.png',
                        fit: BoxFit.fitHeight,
                        // alignment: Alignment.topCenter,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Flexible(
              flex: 1,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Container(
                  height: size.height,
                  decoration: BoxDecoration(
                      color: kPrimaryLightColor,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'img/tawaran_produsen.png',
                        fit: BoxFit.fitHeight,
                        // alignment: Alignment.topCenter,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Image.asset(
                        'img/txtprofilpengguna.png',
                        fit: BoxFit.fitHeight,
                        // alignment: Alignment.topCenter,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Flexible(
              flex: 1,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Container(
                  height: size.height,
                  decoration: BoxDecoration(
                      color: kPrimaryLightColor,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'img/dataprodusen.png',
                        fit: BoxFit.fitHeight,
                        // alignment: Alignment.topCenter,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Image.asset(
                        'img/txtprofilpengguna.png',
                        fit: BoxFit.fitHeight,
                        // alignment: Alignment.topCenter,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
