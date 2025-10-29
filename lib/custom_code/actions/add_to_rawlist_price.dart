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

Future<List<dynamic>> addToRawlistPrice(
  dynamic document,
  double? price,
) async {
  // Add your function code here!
  // Add your function code here!
  List<dynamic> list = FFAppState().rawCartList;
  var y = 1;
  print(document);

  // Calculate GST percentages
  double gstPercentage = double.parse(document['gstPer']);
  double cgstPercentage = gstPercentage / 2;
  double sgstPercentage = gstPercentage / 2;

  // Calculate GST amounts
  double gstAmount = document['gstAmt'].toDouble();
  double cgstAmount = gstAmount / 2;
  double sgstAmount = gstAmount / 2;

  final data = {
    "name": document['name'],
    "price": price,
    "quantity": y.toDouble(),
    "total": (document['total'])!.toDouble() * y.toDouble(),
    "discount": document['discount'],
    "discountPer": document['discountPer'],
    "totalprice": (document['totalprice'])!.toDouble() + document['discount'],
    "delliveryChrg": document['delliveryChrg'],
    "gstAmt": gstAmount,
    "gstPer": gstPercentage,
    "mrpPrice": document['mrpPrice'],
    "cgst": cgstAmount,
    "sgst": sgstAmount,
    "cgstPer": cgstPercentage,
    "sgstPer": sgstPercentage,
    "inclusiveGST": document['inclusiveGST'],
  };

  var flag = false;
  if (list.isNotEmpty) {
    for (int i = 0; i < list.length; i++) {
      if (list[i]["name"] == data["name"]) {
        list[i]["price"] = price;
        list[i]["total"] = list[i]["quantity"] * price;

        if (list[i]["inclusiveGST"] == true) {
          // Calculate total with inclusive GST
          list[i]["gstAmt"] = (price! - (price / (1 + gstPercentage / 100))) *
              list[i]["quantity"];
          list[i]["cgst"] = list[i]["gstAmt"] / 2;
          list[i]["sgst"] = list[i]["gstAmt"] / 2;
          list[i]["totalprice"] =
              (price * list[i]["quantity"]) - list[i]["gstAmt"];
        } else {
          // Calculate total with exclusive GST
          list[i]["gstAmt"] =
              (price! * gstPercentage / 100) * list[i]["quantity"];
          list[i]["cgst"] = list[i]["gstAmt"] / 2;
          list[i]["sgst"] = list[i]["gstAmt"] / 2;
          list[i]["totalprice"] =
              (price * list[i]["quantity"]) + list[i]["gstAmt"];
        }

        FFAppState().rawCartList = list;
        flag = true;
        break;
      }
    }
    if (!flag) {
      if (data["inclusiveGST"] == true) {
        // Calculate total with inclusive GST
        data["gstAmt"] =
            (price! - (price / (1 + gstPercentage / 100))) * y.toDouble();
        data["cgst"] = data["gstAmt"] / 2;
        data["sgst"] = data["gstAmt"] / 2;
        data["totalprice"] = (price * y.toDouble()) - data["gstAmt"];
      } else {
        // Calculate total with exclusive GST
        data["gstAmt"] = (price! * gstPercentage / 100) * y.toDouble();
        data["cgst"] = data["gstAmt"] / 2;
        data["sgst"] = data["gstAmt"] / 2;
        data["totalprice"] = (price * y.toDouble()) + data["gstAmt"];
      }

      FFAppState().rawCartList.add(data);
    }
  } else {
    if (data["inclusiveGST"] == true) {
      // Calculate total with inclusive GST
      data["gstAmt"] =
          (price! - (price / (1 + gstPercentage / 100))) * y.toDouble();
      data["cgst"] = data["gstAmt"] / 2;
      data["sgst"] = data["gstAmt"] / 2;
      data["totalprice"] = (price * y.toDouble()) - data["gstAmt"];
    } else {
      // Calculate total with exclusive GST
      data["gstAmt"] = (price! * gstPercentage / 100) * y.toDouble();
      data["cgst"] = data["gstAmt"] / 2;
      data["sgst"] = data["gstAmt"] / 2;
      data["totalprice"] = (price * y.toDouble()) + data["gstAmt"];
    }

    FFAppState().rawCartList.add(data);
  }

  return FFAppState().rawCartList;
}
