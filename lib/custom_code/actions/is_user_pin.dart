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

Future<bool?> isUserPin(
  List<dynamic> doc,
  String? pin,
) async {
  bool? p;
  for (int i = 0; i < doc.length; i++) {
    print(doc[i]["password"]);
    if (doc[i]["password"] == pin) {
      p = true;
    } else {
      p = false;
    }
  }
  print("password");
  print(p);
  return p;
}
