import 'dart:async';

import 'package:coastella/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShopDetailMap extends StatefulWidget {

  final Shop shop;
  ShopDetailMap(this.shop);

  @override
  _ShopDetailMapState createState() => _ShopDetailMapState();
}

class _ShopDetailMapState extends State<ShopDetailMap> {
  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> _controller = Completer();

    final _mediaQuery = MediaQuery.of(context).size;

    double lat = double.parse(widget.shop.lat);
    double long = double.parse(widget.shop.long);

    return Container(
      height: _mediaQuery.height * 0.4,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(lat,long),
          zoom: 16,
        ),
        markers: {
          Marker(
              markerId: MarkerId("abc"),
              position: LatLng(lat, long),),
        },
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
