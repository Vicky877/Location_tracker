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

  @override
  void _refreshItems() {
    print("refresh");
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
      print("resdsdsdsdsds");
      _items = data.reversed.toList();
      place = _items;
      print("fuckkkkkkkkkkkkkkkkkkkkk");
      print(_items);
      print(place);
    });
  }

  Future<void> _location(Map<String, dynamic> newItem) async {
    final location = Hive.box('location');
    await location.add(newItem);
    _refreshItems();
  }

  onAlertWithCustomContentPressed(context) {
    Alert(
        context: context,
        title: "Add Location Details",
        content: Column(
          children: <Widget>[
            TextFormField(
              controller: placeController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextFormField(
              controller: latitudeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Latitude',
              ),
            ),
            TextFormField(
              controller: longitudeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Longitude ',
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            color: Colors.green,
            onPressed: () {
              _location({
                "location": placeController.text,
                "latitude": latitudeController.text,
                "longitude": longitudeController.text,
              });
              Navigator.pop(context);

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
        title: Center(child: Text("Pick your Location")),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ListView.builder(
            //location=Hive.box("locaion");
            itemCount: _items.length,
            itemBuilder: (context, index) {
              final currentItem = _items[index];
              print("object.............................");
              print(location.get(index)['location']);
              //int newIndex = index + 1;
              return Card(
                child: ListTile(
                  leading: Text(currentItem['location']),
                  onTap: () {
                    var latta = place[index]['latitude'];
                    var longss = place[index]['longitude'];
                    print(latta);
                    print(latta.runtimeType);
                    print(longss);
                    // lat = (addlocations[index]["latitude"]);
                    lats = double.parse("$latta");
                    longs = double.parse("$longss");
                    print(lat);
                    print(lat.runtimeType);
                    // long = (addlocations[index]["longitude"]);
                    // lats = double.parse("$lat");
                    // print(lats);
                    //longs = double.parse("$long");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => mapScreen()),
                    );
                  },
                  trailing: Text(
                    currentItem["longitude"] + "    " + currentItem["latitude"],
                    style: TextStyle(
                        color: Color.fromARGB(255, 2, 2, 2), fontSize: 15),
                  ),
                  //title: Text(addlocations[index]["location"].toString())
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        onPressed: () {
          onAlertWithCustomContentPressed(context);
          print("object");
        },
      ),
    );
  }
}
