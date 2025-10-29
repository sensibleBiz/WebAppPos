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

Future<List<PurchaseSaleItemListStruct>> getPurchaseItems(
    List<dynamic> rawCartList) async {
  // Add your function code here!
  List<PurchaseSaleItemListStruct> returnList = [];
  PurchaseSaleItemListStruct struct = PurchaseSaleItemListStruct();
  if (rawCartList.isNotEmpty) {
    for (int j = 0; j < rawCartList.length; j++) {
      print(rawCartList[j]);

      struct = createPurchaseSaleItemListStruct(
          name: rawCartList[j]["name"],
          price: rawCartList[j]["price"],
          quantity: rawCartList[j]["quantity"],
          total: rawCartList[j]["total"],
          id: rawCartList[j]["id"],
          catId: rawCartList[j]["catId"],
          discount: rawCartList[j]["discount"],
          gstPer: rawCartList[j]["gstPer"],
          gstAmt: rawCartList[j]["gstAmt"],
          mrpPrice: rawCartList[j]["mrpPrice"],
          cgst: rawCartList[j]["cgst"],
          sgst: rawCartList[j]["sgst"],
          cgstPer: rawCartList[j]["cgstPer"] is String
              ? int.parse(rawCartList[j]["cgstPer"])
              : rawCartList[j]["cgstPer"].toInt(),
          sgstPer: rawCartList[j]["sgstPer"] is String
              ? int.parse(rawCartList[j]["sgstPer"])
              : rawCartList[j]["sgstPer"].toInt(),
          delliveryChrg: rawCartList[j]["delliveryChrg"]);
      returnList.add(struct);
    }
  }

  return returnList;
}
