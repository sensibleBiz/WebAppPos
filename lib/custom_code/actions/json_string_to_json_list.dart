// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'dart:convert';

Future<List<String>> jsonStringToJsonList(String value) async {
  // Add your function code here!
  List<dynamic> list = jsonDecode(value);
  print(list);

  return list;
}
