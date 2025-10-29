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

Future<List<dynamic>> addToListCopy(ProductRecord? document) async {
  // Add your function code here!
  List<dynamic> list = FFAppState().itemCartList;

  // print(document);
  final data = {
    "name": document!.name,
    "price": (document.mrpPrice)!.toDouble(),
    "sellingPrice": document.sellingPrice,
    "mrpPrice": document.mrpPrice,
    "purchasePrice": document.purchasePrice,
    "quantity": 1
  };

  var flag = false;
  if (list.isNotEmpty) {
    // print("list");
    // print(list);
    for (int i = 0; i < list.length; i++) {
      if (list[i]["name"] == data["name"]) {
        list[i]["quantity"]++;
        FFAppState().itemCartList = list;
        flag = true;
        break;
      }
    }
    if (!flag) {
      FFAppState().itemCartList.add(data);
    }
  } else {
    FFAppState().itemCartList.add(data);
  }
  // print(FFAppState().itemCartList);
  return FFAppState().itemCartList;
}
