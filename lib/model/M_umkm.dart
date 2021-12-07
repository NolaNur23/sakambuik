import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:sakambuik/constant.dart';

class UMKM {
  String nama_produk;
  String deskripsi;
  String komposisi;
  String stok;
  String kemampuan_membuat;
  String kategori;
  String foto_produk;
  String tgl_buat;
  String id_produk;

  UMKM(
      {this.nama_produk,
      this.deskripsi,
      this.komposisi,
      this.id_produk,
      this.stok,
      this.kemampuan_membuat,
      this.kategori,
      this.foto_produk,
      this.tgl_buat});

  factory UMKM.fromJson(Map<String, dynamic> object) {
    return UMKM(
      nama_produk: object['produk'],
      deskripsi: object['deskripsi'],
      id_produk: object['id_produk'],
      komposisi: object['komposisi'],
      stok: object['stok'],
      kemampuan_membuat: object['kemampuan membuat'],
      kategori: object['kategori'],
      foto_produk: object['foto_produk'],
      tgl_buat: object['tgl_buat'],
    );
  }
}

Future<List<UMKM>> fetechUMKM(String username) async {
  final jobListApiUrl = api + 'api/UMKM_umum?username=' + username;
  final response = await http.get(jobListApiUrl);

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((umkm) => UMKM.fromJson(umkm)).toList();
  } else {
    throw Exception('Failed to load product from api');
  }
}
