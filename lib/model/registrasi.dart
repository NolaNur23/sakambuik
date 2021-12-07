import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sakambuik/constant.dart';

class Register {
  int Kode;
  String pesan;

  Register({this.Kode, this.pesan});

  factory Register.fromJson(Map<String, dynamic> object) {
    return Register(Kode: object['kode'], pesan: object['pesan']);
  }

  static Future<Register> connectToApi(
    String jenis,
    String nama_usaha,
    String nama,
    String legalitas,
    String telepon,
    String alamat,
    String username,
    String password,
    String id_koperasi,
    String id_produsen,
  ) async {
    String apiUrl = api +
        'api/register?jenis=' +
        jenis +
        '&nama_usaha=' +
        nama_usaha +
        '&nama=' +
        nama +
        '&legalitas=' +
        legalitas +
        '&telepon=' +
        telepon +
        '&alamat=' +
        alamat +
        '&username=' +
        username +
        '&password=' +
        password +
        '&id_koperasi=' +
        id_koperasi +
        '&id_produsen=' +
        id_produsen;

    var apiResult = await http.get(apiUrl);
    var jsonObject = json.decode(apiResult.body);
    // var userData = (jsonObject as Map<String, dynamic>)['pesan'];
    return Register.fromJson(jsonObject);
  }
}
