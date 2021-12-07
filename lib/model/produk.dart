import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:sakambuik/constant.dart';

class Produk {
  final String deskripsi,
      nama,
      produk,
      gambar_produk,
      total,
      rating,
      alamat_umkm,
      telp,
      foto_umkm,
      komposisi,
      stok,
      kemampuan_buat,
      kategori,
      //alamat
      latitude,
       url_map,
      longitude;

  Produk({
    this.deskripsi,
    this.nama,
    this.produk,
    this.gambar_produk,
    this.total,
    this.rating,
    this.telp,
    this.alamat_umkm,
    this.foto_umkm,
    this.url_map,
    this.komposisi,
    this.stok,
    this.kemampuan_buat,
    this.kategori,
    this.latitude,
    this.longitude,
  });

  factory Produk.fromJson(Map<String, dynamic> json) {
    return Produk(
      deskripsi: json['deskripsi'],
      nama: json['nama'],
      produk: json['produk'],
      gambar_produk: json['foto_produk'],
      total: json['total'],
      rating: json['rating'],
      alamat_umkm: json['alamat_umkm_umum'],
      telp: json['telp'],
      foto_umkm: json['foto_umkm'],
      url_map: json['url_map'],
      komposisi: json['komposisi'],
      stok: json['stok'],
      kemampuan_buat: json['kemampuan_buat'],
      kategori: json['kategori'],
      latitude: json['latitude'],
      longitude: json['longtude'],
    );
  }
}

Future<List<Produk>> fetechProduk() async {
  final jobListApiUrl = api + 'api/produk';
  final response = await http.get(jobListApiUrl);

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((produk) => Produk.fromJson(produk)).toList();
  } else {
    throw Exception('Failed to load product from api');
  }
}
