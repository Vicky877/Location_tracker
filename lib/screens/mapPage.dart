import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import '../constants.dart';
import 'locationPage.dart';

class mapScreen extends StatefulWidget {
  @override
  _mapScreenState createState() => _mapScreenState();
}

class _mapScreenState extends State<mapScreen> {
  LatLng _center = LatLng(lats, longs);
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> _markers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _markers.add(Marker(
      markerId: MarkerId('1'),
      position: LatLng(lats, longs),
    ));
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: Set<Marker>.of(_markers),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(lats, longs),
          zoom: 10.0,
        ),
        mapType: MapType.normal,
      ),
    );
  }
}
