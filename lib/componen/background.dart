import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class Background extends StatelessWidget {
  final Widget child;
  final String judul;
  const Background({
    Key key,
    this.judul,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              // color: Colors.amber,
              height: size.height * 0.5187406296851574,
              width: size.width * 1.0,

              child: Image.asset("img/header_back.png", fit: BoxFit.fill),
            ),
          ),
          Positioned(
              top: size.height * 0.125,
              child: Text(
                judul,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )),
          child,
        ],
      ),
    );
  }
}
