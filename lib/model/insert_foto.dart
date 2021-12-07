import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sakambuik/constant.dart';

class InsertFoto {
  int Kode;
  String pesan;

  InsertFoto({this.Kode, this.pesan});

  factory InsertFoto.fromJson(Map<String, dynamic> object) {
    return InsertFoto(Kode: object['kode'], pesan: object['pesan']);
  }

  static Future<InsertFoto> connectToApi(
    String id_produk,
    String id_umkm,
    String foto_produk,
  ) async {
    final response = await http.post(
      Uri.parse(api + 'api/UMKM_umum?'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id_produk': id_produk,
        'id_umkm': id_umkm,
        'foto_produk': foto_produk,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return InsertFoto.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }

  }
}
