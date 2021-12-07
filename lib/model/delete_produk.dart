import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sakambuik/constant.dart';

class DeleteProduk {
  int kode;
  String pesan;

  DeleteProduk({this.kode, this.pesan});

  factory DeleteProduk.fromJson(Map<String, dynamic> object) {
    return DeleteProduk(kode: object['kode'], pesan: object['pesan']);
  }

  static Future<DeleteProduk> connectToApi(String id_produk) async {
    String apiUrl = api + 'api/UMKM_Delete?id=' + id_produk;

    var apiResult = await http.get(apiUrl);
    var jsonObject = json.decode(apiResult.body);
    // var userData = (jsonObject as Map<String, dynamic>)['pesan'];
    return DeleteProduk.fromJson(jsonObject);
  }
}
