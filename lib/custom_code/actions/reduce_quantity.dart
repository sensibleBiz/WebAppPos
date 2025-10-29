// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<dynamic>> reduceQuantity(dynamic obj) async {
  // Add your function code here!
  List<dynamic> list = FFAppState().rawCartList;
  int index = list.indexOf(obj);
  print("index");
  print(index);
  // dynamic item = list[index];
  if (list[index]["quantity"] > 1) {
    list[index]["quantity"]--;

    FFAppState().rawCartList = list;
  }
  return (FFAppState().rawCartList);
}
