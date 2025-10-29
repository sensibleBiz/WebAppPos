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

Future<double> calSubTotal(List<dynamic> obj) async {
  // Add your function code here!
  double total = 0;
  double qty = 0;
//  print(obj.length);
  for (int i = 0; i < obj.length; i++) {
    //   print(obj[i]);
    //  print(obj[i]["quantity"]);

    obj[i]["total"] = obj[i]["quantity"] * obj[i]["price"];
    total += obj[i]["quantity"] * obj[i]["price"];
    qty += obj[i]["quantity"];
    print(total);
  }
  FFAppState().finalAmt = total.toDouble();
  FFAppState().subTotal = total.toDouble();
  FFAppState().totalQuantity = qty.toDouble();
  print(total);

  return total.toDouble();
}
