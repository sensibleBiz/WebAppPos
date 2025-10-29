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

Future<double> roundOff(
  double? roundoff,
  double? roundOffAmt,
  double? subTotal,
  double? finalAmt,
) async {
  // Add your function code here!
  double fAmt = 0.0;
  if (subTotal != null && finalAmt != null) {
    if (roundOffAmt != null) {
      if (roundoff! > 0) {
        FFAppState().finalAmt += roundOffAmt;
      } else {
        FFAppState().finalAmt -= roundOffAmt;
      }
    } else {
      fAmt = finalAmt;
    }
  } else {
    fAmt = 0.0;
  }
  print("subTotal");
  print(subTotal);
  print("finalAmt");
  print(FFAppState().finalAmt);

  return FFAppState().finalAmt;
}
