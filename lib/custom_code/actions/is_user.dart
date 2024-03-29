// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool?> isUser(List<dynamic> doc) async {
  // Add your function code here!
  bool? u;
  for (int i = 0; i < doc.length; i++) {
    print(doc[i]["role"]);
    if (doc[i]["role"] == "user") {
      u = true;
    } else {
      u = false;
    }
  }
  print("user");
  print(u);
  return u;
}
