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

import 'dart:convert';

Future<double> upiTotal(String? paymentValueString) async {
  // Add your function code here!
  String paymentValueString1 =
      '{"cash":1200,"credit":0,"digital":0,"card":10,"googlepay":15,"phonepe":29,"other":0}';
  double upiTotalAmount = 0;
  List<dynamic> objList;

  Map<String, dynamic>? d = json.decode(paymentValueString1);
  objList = [];
  objList.add({"paymentInfo": d});

  print(objList[0]);
  return upiTotalAmount;
}
