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

Future<double> getTotal(
  double? price,
  double? disAmt,
  double? delCharges,
  double? gstPercentage,
) async {
  // Add your function code here!
  double finalAmt = 0.0;
  if (price != null) {
    finalAmt = price;

    if (delCharges != null) {
      finalAmt += delCharges;

      //finalAmt += gstPercentage;
    }
    if (FFAppState().allinclusive == false) {
      if (gstPercentage != null) {
        // Calculate GST amount and add to final amount
        // final gstAmount = (finalAmt * gstPercentage) / 100;
        finalAmt += gstPercentage;
      }
    }
    if (disAmt != null) {
      finalAmt -= disAmt;
    }
  } else {
    finalAmt = 0.0;
  }

  print(finalAmt);
  FFAppState().totalPrice = finalAmt.toDouble();
  return finalAmt.toDouble();
}
