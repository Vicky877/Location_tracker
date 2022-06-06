import 'package:flutter/material.dart';

var formKey = GlobalKey<FormState>();
var textFieldController = TextEditingController();
var placeController = TextEditingController();
var longitudeController = TextEditingController();
var latitudeController = TextEditingController();
var lat;
var long;
double lats = 0;
double longs = 0;
List addlocations = [];
bool _validate = false;
var location;
List<dynamic> place = [];
