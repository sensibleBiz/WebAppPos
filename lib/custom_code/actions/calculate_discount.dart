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

import 'dart:convert';

import 'dart:convert';

Future<dynamic> calculateDiscount(double? discountAmt) async {
  dynamic list = FFAppState().jsonrawcart;
  List<dynamic> list2 = FFAppState().rawCartList;

  if (discountAmt == null) {
    return {
      "error": "Discount amount is null",
    };
  }

  int price = 0; // Base price
  int totalprice = 0; // Total price including GST
  int quantity = 0;
  bool found = false;

  // Find the product in the cart
  for (int i = 0; i < list2.length; i++) {
    if (list2[i]['name'] == list['name']) {
      price = list2[i]['price'].toInt();
      totalprice = list2[i]['totalprice'].toInt();
      quantity = list2[i]['quantity'].toInt();
      found = true;
      break;
    }
  }

  if (!found) {
    return {
      "error": "Item not found in cart",
    };
  }

  // Calculate the total before discount
  int totalBeforeDiscount = totalprice * quantity;

  // Calculate the discount percentage
  double discountPercentage = (discountAmt / totalBeforeDiscount) * 100;

  // Calculate new total after discount
  double totalAfterDiscount = totalBeforeDiscount - discountAmt;

  // Update the product in the list
  for (int i = 0; i < list2.length; i++) {
    if (list2[i]['name'] == list['name']) {
      list2[i]['price'] = totalprice - discountAmt;
      list2[i]['total'] = list2[i]['price'] * quantity; // Total after discount
      list2[i]['discount'] = discountAmt;
      list2[i]['discountPer'] = discountPercentage;
      break;
    }
  }

  // Calculate the new subtotal for all items in the cart
  double subtotal = list2.fold(0.0, (sum, item) => sum + item['total']);
  FFAppState().subTotal = subtotal;
  FFAppState().finalAmt = subtotal;

  // Return the updated product details
  return {
    "name": list['name'],
    "price": price,
    "quantity": quantity,
    "total": price - discountAmt * quantity,
    "discount": discountAmt,
    "discountPer": discountPercentage,
    "deliveryChrg": 0, // Assuming delivery charge is 0
  };
}
