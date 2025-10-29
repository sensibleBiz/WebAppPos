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

Future<List<dynamic>> addToRawlist(ProductRecord? document) async {
  // Add your function code here!
  List<dynamic> list = FFAppState().rawCartList;
  var y = 1;
  print(document);
  final data = {
    "name": document!.name,
    "price": (document.sellingPrice)!.toDouble(),
    "quantity": y.toDouble(),
    "total": (document.sellingPrice)!.toDouble() * y.toDouble(),
    "discount": document!.discountAmt,
    "discountPer": document!.discountPer,
    "totalprice": (document.sellingPrice)!.toDouble() + document!.discountAmt,
    "delliveryChrg": document!.delliveryChrg,
    "gstAmt": document!.gstAmt,
    "gstPer": document!.gstPer,
    "mrpPrice": document!.mrpPrice,
    "cgst": document!.gstAmt / 2,
    "sgst": document!.gstAmt / 2,
    "cgstPer": int.parse(document!.gstPer) / 2,
    "sgstPer": int.parse(document!.gstPer) / 2,
    "inclusiveGST": document!.inclusiveGST,
  };

  var flag = false;
  if (list.isNotEmpty) {
    for (int i = 0; i < list.length; i++) {
      if (list[i]["name"] == data["name"]) {
        list[i]["quantity"]++;
        list[i]["total"] = list[i]["quantity"] * list[i]["price"];
        FFAppState().rawCartList = list;
        flag = true;
        break;
      }
    }
    if (!flag) {
      FFAppState().rawCartList.add(data);
    }
  } else {
    FFAppState().rawCartList.add(data);
  }

  return FFAppState().rawCartList;
}
