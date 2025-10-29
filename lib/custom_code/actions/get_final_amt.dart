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

Future<double> getFinalAmt(
  double? charges,
  double? disAmt,
  double? subTotal,
) async {
  // Add your function code here!
  double fAmt;
  if (subTotal! > 0) {
    fAmt = subTotal;

    if (charges != null) {
      fAmt += charges;
    }
    if (disAmt != null) {
      fAmt -= disAmt;
    }
    FFAppState().finalAmt = fAmt.toDouble();
  } else {
    fAmt = 0.0;
  }

  print("subTotal");
  print(subTotal);
  print("fAmt");
  print(fAmt);
  print("finalAmt");
  print(FFAppState().finalAmt);

  return fAmt.toDouble();
}
