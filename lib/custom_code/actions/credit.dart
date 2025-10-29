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

Future<double?> credit(
  String payMode,
  double finalAmt,
  PartyRecord? doc,
) async {
  // Add your function code here!
  double? b = 0.0;
  if (payMode == "Credit") {
    if (doc!.balance != null) {
      b = doc.balance! + finalAmt;
    } else {
      b = finalAmt;
    }
  } else {
    b = 0.0;
  }
  return b;
}
