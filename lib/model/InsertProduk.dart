import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sakambuik/constant.dart';

class InsertProduk {
  int Kode;
  String pesan;

  InsertProduk({this.Kode, this.pesan});

  factory InsertProduk.fromJson(Map<String, dynamic> object) {
    return InsertProduk(Kode: object['kode'], pesan: object['pesan']);
  }

  static Future<InsertProduk> connectToApi(
    String id_produk,
    String id_umkm,
    String produk,
    String id_kategori,
    String komposisi,
    int daya_buat,
    String satuan,
    int waktu_buat,
    String stok,
    String tgl_stok,
    String tgl_buat,
    String deskripsi,
  ) async {
    final response = await http.post(
      Uri.parse(api + 'api/UMKM_umum?'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id_produk': id_produk,
        'id_umkm': id_umkm,
        'produk': produk,
        'id_kategori': id_kategori,
        'komposisi': komposisi,
        'daya_buat': daya_buat,
        'satuan': satuan,
        'waktu_buat': waktu_buat,
        'stok': stok,
        'tgl_stok': tgl_stok,
        'tgl_stok': tgl_buat,
        'deskripsi': deskripsi,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return InsertProduk.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
    // String apiUrl = api +
    //     'api/UMKM_umum?id_produk=' +

    // var apiResult = await http.post(apiUrl);
    // var jsonObject = json.decode(apiResult.body);
    // // var userData = (jsonObject as Map<String, dynamic>)['pesan'];
    // return InsertProduk.fromJson(jsonObject);
  }
}
