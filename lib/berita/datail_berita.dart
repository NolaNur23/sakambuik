import 'package:flutter/material.dart';

class DetailBerita extends StatelessWidget {
  final url;
  final title;
  final content;
  final publishedAt;
  final author;
  final urlToImage;

  DetailBerita(
      {this.url,
      this.title,
      this.content,
      this.publishedAt,
      this.author,
      this.urlToImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          urlToImage != null
              ? Image.network(urlToImage)
              : Container(
                  height: 250,
                  color: Colors.grey[400],
                ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$title',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  '$publishedAt',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 20),
                Text('$content'),
                Divider(),
                Text('Author: $author'),
                Text('$url'),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber[500],
          child: Icon(Icons.close),
          onPressed: () => Navigator.pop(context)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
