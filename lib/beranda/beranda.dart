import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sakambuik/constant.dart';

final List<String> imgList = [
  'img/boarding1.png',
  'img/boarding2.png',
  'img/boarding3.png',
];
final List<Map<dynamic, String>> rekom = [
  {
    'nama': 'Pantai Kuta',
    'lokasi': 'Denpasar, Bali',
    'gambar': 'img/boarding1.png',
  },
  {
    'nama': 'Raja Ampat',
    'lokasi': 'Papua, Papua Barat',
    'gambar': 'img/boarding2.png',
  },
  {
    'nama': 'Raja Ampat',
    'lokasi': 'Papua, Papua Barat',
    'gambar': 'img/boarding3.png',
  },
];

class PageBeranda extends StatefulWidget {
  const PageBeranda({Key key}) : super(key: key);

  @override
  _PageBerandaState createState() => _PageBerandaState();
}

class _PageBerandaState extends State<PageBeranda> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        title: Text(
          'Sakambuik',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Ubuntu',
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              CarouselSlider(
                items: imageSliders,
                carouselController: _controller,
                options: CarouselOptions(
                    viewportFraction: 1, //hanya menampilkan 1 bagian
                    autoPlay: true, //gammbar bergerak(slide) otomatis
                    // enlargeCenterPage: true, //membesar ketika slide
                    aspectRatio: 2.2,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final List<Widget> imageSliders = imgList
      .map(
        (item) => Container(
          child: Container(
            child: ClipRRect(
              child: Stack(
                alignment: Alignment.centerLeft,
                children: <Widget>[
                  Image.asset(
                    item,
                    fit: BoxFit.cover,
                    height: double.maxFinite,
                    width: double.maxFinite,
                  ),
                  Positioned(
                    bottom: 60,
                    left: 20,
                    child: Column(
                      children: [
                        Text(
                          'Memajukan UMKM Kabupaten Lima Puluh Kota',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Ubuntu',
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
      .toList();
}
