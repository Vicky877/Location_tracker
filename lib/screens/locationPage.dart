import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../bottomNaigate.dart';
import '../constants.dart';
import 'mapPage.dart';

class locationPage extends StatefulWidget {
  const locationPage({Key? key}) : super(key: key);

  @override
  State<locationPage> createState() => _locationPageState();
}

class _locationPageState extends State<locationPage> {
  List<dynamic> _items = [];
  late AnimationController loadingcontroller;
  bool _loading = true;

  //@override
  @override
  void initState() {
    super.initState();
    _refershLocation();
  }

  void _refershLocation() {
    var data = location.keys.map((key) {
      var value = location.get(key);
      return {
        "key": key,
        "location": value["location"],
        "latitude": value['latitude'],
        "longitude": value['longitude']
      };
    }).toList();

    setState(() {
      _items = data.reversed.toList();
      place = _items;
    });
  }

  Future<void> _location(Map<String, dynamic> newItem) async {
    final location = Hive.box('location');
    await location.add(newItem);
    _refershLocation();
  }

  onAlertWithCustomContentPressed(context) {
    Alert(
        context: context,
        title: "Add Location Details",
        content: Form(
          key: formGlobalKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: placeController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return "Invalid Name";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: latitudeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Latitude',
                ),
                validator: (value) {
                  if (value!.trim().isEmpty ||
                      RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return "Invalid Latitude";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: longitudeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Longitude ',
                ),
                validator: (value) {
                  if (value!.trim().isEmpty ||
                      RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return "Invalid Longitude";
                  } else {
                    return null;
                  }
                },
              ),
            ],
          ),
        ),
        buttons: [
          DialogButton(
            color: Color(0xff784cc6),
            onPressed: () {
              if (formGlobalKey.currentState!.validate()) {
                _location({
                  "location": placeController.text,
                  "latitude": latitudeController.text,
                  "longitude": longitudeController.text,
                });
                Navigator.pop(context);
              }

              var dis = {};
              dis["location"] = placeController.text;
              dis["longitude"] = longitudeController.text;
              dis["latitude"] = latitudeController.text;
              addlocations.add(dis);
              placeController.clear();
              longitudeController.clear();
              latitudeController.clear();
            },
            child: Text(
              "Submit",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("Add your Location",
                style: TextStyle(
                  fontSize: 22,
                  letterSpacing: 1.0,
                ))),
        //backgroundColor: Colors.green,
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 5, right: 5),
          child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final currentItem = _items[index];
                int newIndex = index + 1;
                return Card(
                  child: ListTile(
                    leading: Text(
                      newIndex.toString() + "    " + currentItem['location'],
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.0,
                      ),
                    ),
                    onTap: () {
                      var latta = place[index]['latitude'];
                      var longss = place[index]['longitude'];
                      lats = double.parse("$latta");
                      longs = double.parse("$longss");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => mapScreen()),
                      );
                    },
                    trailing: Text(
                      currentItem["longitude"] +
                          "    " +
                          currentItem["latitude"],
                      style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color(0xff784cc6),
        foregroundColor: Colors.white,
        onPressed: () {
          onAlertWithCustomContentPressed(context);
        },
      ),
    );
  }
}
