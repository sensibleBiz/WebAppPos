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

Future comboPrice() async {
  // Add your function code here!
  List<dynamic> list = FFAppState().itemCartList;
  // Add your function code here!
  print("list");
  print(list);
  double sTotal;
  double mTotal;
  double pTotal;
  double sellingPrice = 0, mrpPrice = 0, purchasePrice = 0;
  for (int i = 0; i < list.length; i++) {
    print(list[0]);

    sellingPrice += list[i]["sellingPrice"];
    mrpPrice += list[i]["mrpPrice"];
    purchasePrice += list[i]["purchasePrice"];

    sTotal = sellingPrice;
    mTotal = mrpPrice;
    pTotal = purchasePrice;

    print(sTotal);
    print(mTotal);
    print(pTotal);

    FFAppState().comboSellingPrice = sTotal;
    FFAppState().comboMRPPrice = mTotal;
    FFAppState().comboPurchasePrice = pTotal;
  }
}
