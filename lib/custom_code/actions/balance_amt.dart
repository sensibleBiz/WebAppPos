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

Future<double> balanceAmt(
  double? paidAmt,
  double finalAmt,
) async {
  // Add your function code here!
  double value;
  if (paidAmt == null) {
    value = finalAmt;
  } else {
    value = finalAmt - paidAmt;
  }
  print(value);
  FFAppState().balAmt = value.toDouble();
  return value.toDouble();
}
