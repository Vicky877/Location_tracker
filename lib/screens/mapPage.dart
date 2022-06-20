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
    super.initState();
    print(
        "checkkkkvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv");
    print(_markers);
    _markers.add(Marker(
      consumeTapEvents: true,
      markerId: MarkerId('marker'),
      position: LatLng(11.0168, 76.9558),
      infoWindow: InfoWindow(title: "Title", snippet: "Good\nMorning"),
    ));
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text('Your Location',
              style: TextStyle(
                fontSize: 22,
                letterSpacing: 1.0,
              )),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff784cc6), Color(0xff3dc1fd)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: GoogleMap(
        markers: Set<Marker>.of(_markers),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(lats, longs),
          zoom: 14.0,
        ),
        mapType: MapType.terrain,
      ),
    );
  }
}
