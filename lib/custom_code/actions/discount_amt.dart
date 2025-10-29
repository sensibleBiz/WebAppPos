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

Future<double> discountAmt(
  double? discountPer,
  double? sellingPrice,
) async {
  // Add your function code he
  double output;
  double amt = 0.0;
  if (discountPer != null) {
    output = (sellingPrice! * discountPer) / 100;
    amt = output;
  } else {
    amt = 0.0;
  }
  print(amt);
  FFAppState().disAmt = amt.toDouble();
  return amt.toDouble();
}
