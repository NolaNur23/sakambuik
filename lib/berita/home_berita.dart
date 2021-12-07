import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:sakambuik/berita/datail_berita.dart';
import 'package:sakambuik/componen/background.dart';

class HomeBerita extends StatefulWidget {
  _HomeBeritaState createState() => _HomeBeritaState();
}

class _HomeBeritaState extends State<HomeBerita> {
  List _posts = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        // appBar: AppBar(title: Text('Berita')),
        body: Background(
      judul: "Berita",
      child: Container(
        margin: EdgeInsets.only(
            left: size.width * 0.05,
            right: size.width * 0.05,
            top: size.height * 0.25,
            bottom: size.height * 0),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3))
            ]),
        height: size.height * 0.68,
        child: ListView.builder(
          // padding: EdgeInsets.only(top: 300.0),
          itemCount: _posts.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                color: Colors.grey[200],
                height: 100,
                width: 100,
                child: _posts[index]['urlToImage'] != null
                    ? Image.network(
                        _posts[index]['urlToImage'],
                        width: 100,
                        fit: BoxFit.cover,
                      )
                    : Center(),
              ),
              title: Text(
                '${_posts[index]['title']}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                '${_posts[index]['description']}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) => DetailBerita(
                      url: _posts[index]['url'],
                      title: _posts[index]['title'],
                      content: _posts[index]['content'],
                      publishedAt: _posts[index]['publishedAt'],
                      author: _posts[index]['author'],
                      urlToImage: _posts[index]['urlToImage'],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    ));
  }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=850afbaf4b1444eeaacb6ab78735dae6'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _posts = data['articles'];
        });
        print(_posts);
      }
    } catch (e) {
      print(e);
    }
  }
}
