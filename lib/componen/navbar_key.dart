import 'package:flutter/cupertino.dart';

class NavBarKey {
  NavBarKey._();

  static final GlobalKey _key = GlobalKey();
  static final GlobalKey _keyUmkm = GlobalKey();

  static GlobalKey getKey() => _key;
  static GlobalKey getKeyUmkm() => _keyUmkm;
}
