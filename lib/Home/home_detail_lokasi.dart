import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sakambuik/model/produk.dart';

class HomeLokasi extends StatefulWidget {
  final TabController tabcontroller;
  final Produk produk;
  const HomeLokasi(this.tabcontroller, this.produk);

  @override
  _HomeLokasiState createState() => _HomeLokasiState();
}

class _HomeLokasiState extends State<HomeLokasi> {
  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    final LatLng pantai = LatLng(double.parse(widget.produk.latitude),
        double.parse(widget.produk.longitude));

    return Scaffold(
        backgroundColor: Color(0xffDCE5F0),
        body: SingleChildScrollView(
            child: Container(
          height: 350,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(target: pantai, zoom: 15),
              markers: <Marker>[
                Marker(
                    markerId: MarkerId('Titik Lokasi'),
                    position: pantai,
                    infoWindow: InfoWindow(title: 'Pantai Kuta'))
              ].toSet(),
            ),
          ),
        )));
  }
}
