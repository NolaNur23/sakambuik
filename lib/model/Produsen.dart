import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:http/http.dart' as http;
import 'package:sakambuik/constant.dart';

class Data {
  String username;
  String produsen;
  String pemilik;
  String legalitas;
  String kontak;
  String alamat;
  String foto_produsen;
  Data({
    this.username,
    this.produsen,
    this.pemilik,
    this.legalitas,
    this.kontak,
    this.alamat,
    this.foto_produsen,
  });
  // @override
  // String toString() {
  //   return 'Data{username: $username, produsen: $produsen, pemilik: $pemilik, legalitas: $legalitas, kontak: $kontak, alamat: $alamat, foto_produsen: $foto_produsen}';
  // }

  factory Data.fromJson(Map<dynamic, dynamic> object) {
    return Data(
      username: object['username'],
      produsen: object['produsen'],
      pemilik: object['pemilik'],
      legalitas: object['legalitas'],
      kontak: object['kontak'],
      alamat: object['alamat'],
      foto_produsen: object['foto_produsen'],
    );
  }
}

class Produsen {
  String Pesan;
  int Kode;
  Data data;

  Produsen({
    this.Pesan,
    this.Kode,
    this.data,
  });
  // @override
  // String toString() {
  //   return 'Produsen{Pesan: $Pesan, Kode: $Kode, data: $data}';
  // }

  factory Produsen.fromJson(Map<dynamic, dynamic> object) {
    return Produsen(
        Pesan: object['pesan'],
        Kode: object['kode'],
        data: Data.fromJson(object['data']));
  }

  static Future<Produsen> connectToApiProdusen(String id_produsen) async {
    String apiUrl = api + 'api/produsen?id_produsen=' + id_produsen;

    var apiResult = await http.get(apiUrl);
    if (apiResult.statusCode == 200) {
      var jsonObject = json.decode(apiResult.body);
      return Produsen.fromJson(jsonObject);
    } else {
      throw Exception('Failed to load user from api');
    }
  }
}
