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

Future<bool> userAsDealerExists(
  UserProfileRecord? user,
  DealersRecord? dealer,
) async {
  bool result = false;
  if (user != null) {
    if (dealer != null) {
      if (user.mobile == dealer.mobile) {
        result = true;
      } else {
        result = false;
      }
    } else {
      result = true;
    }
  } else {
    if (dealer != null) {
      result = true;
    } else {
      result = false;
    }
  }

  return result;
}
