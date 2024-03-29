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

Future setDropdownStatus(
  String status,
  dynamic listItem,
  List<dynamic> list,
) async {
  // Add your function code here!
  int len = list.length;
  for (int i = 0; i < len; i++) {
    print(listItem["id"]);
    print(list[i]["id"]);
    if (listItem["id"] == list[i]["id"]) {
      list[i]["status"] = status;
    }
  }
}
