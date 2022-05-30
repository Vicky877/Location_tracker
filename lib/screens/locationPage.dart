import 'package:flutter/material.dart';

import 'package:rflutter_alert/rflutter_alert.dart';
import '../bottomNaigate.dart';
import '../constants.dart';
import 'mapPage.dart';

class locationPage extends StatefulWidget {
  const locationPage({Key? key}) : super(key: key);

  @override
  State<locationPage> createState() => _locationPageState();
}

bool _loading = true;

class _locationPageState extends State<locationPage> {
  @override
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
              decoration: InputDecoration(
                labelText: 'Latitude',
              ),
            ),
            TextFormField(
              controller: longitudeController,
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
              Navigator.pop(context);
              Future.delayed(Duration(seconds: 1), () {
                Color.fromARGB(255, 38, 45, 189);
                setState(() {
                  _loading = false;
                });
              });
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
            itemCount: addlocations.length,
            itemBuilder: (context, index) {
              int newIndex = index + 1;
              return Card(
                child: ListTile(
                    leading: Text("$newIndex"),
                    onTap: () {
                      lat = (addlocations[index]["latitude"]);
                      long = (addlocations[index]["longitude"]);
                      lats = double.parse("$lat");
                      print(lats);
                      longs = double.parse("$long");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => mapScreen()),
                      );
                    },
                    trailing: Text(
                      addlocations[index]["longitude"].toString() +
                          "    " +
                          addlocations[index]["latitude"].toString(),
                      style: TextStyle(
                          color: Color.fromARGB(255, 2, 2, 2), fontSize: 15),
                    ),
                    title: Text(addlocations[index]["location"].toString())),
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
