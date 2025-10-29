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

Future<double> gstAmt(
  double? sellingPrice,
  double? gstPercentage,
) async {
  // Add your function code here!
  double amt = 0.0;

  // Ensure sellingPrice and gstPercentage are not null and greater than zero
  if (sellingPrice == null ||
      gstPercentage == null ||
      sellingPrice <= 0 ||
      gstPercentage <= 0) {
    return amt;
  }

  // Calculate GST amount based on whether the price is inclusive or exclusive of GST
  if (FFAppState().allinclusive == false) {
    // GST exclusive price
    amt = (sellingPrice * gstPercentage) / 100;
  } else {
    // GST inclusive price
    double originalCost = sellingPrice * 100 / (100 + gstPercentage);
    amt = sellingPrice - originalCost;
  }

  return amt;
}
