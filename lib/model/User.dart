import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sakambuik/constant.dart';

class Data {
  String username;
  String id_level;

  Data({
    this.username,
    this.id_level,
  });
  factory Data.fromJson(Map<String, dynamic> object) {
    return Data(
      username: object['username'],
      id_level: object['id_level'],
    );
  }
}

class User {
  final String Pesan;
  final String id;
  final int Kode;
  final Data data;

  User({this.Pesan, this.Kode, this.data, this.id});

  factory User.fromJson(Map<String, dynamic> object) {
    return User(
        Pesan: object['pesan'],
        Kode: object['kode'],
        id: object['id'],
        data: Data.fromJson(object['data']));
  }

  static Future<User> connectToApi(String Username, String Password) async {
    String apiUrl =
        api + 'api/user?username=' + Username + '&password=' + Password;

    var apiResult = await http.get(apiUrl);
    if (apiResult.statusCode == 200) {
      var jsonObject = json.decode(apiResult.body);
      // var userData = (jsonObject as Map<String, dynamic>)['pesan'];
      return User.fromJson(jsonObject);
    } else {
      throw Exception('Failed to load user from api');
    }
  }
}
