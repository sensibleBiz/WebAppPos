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

Future<List<dynamic>> getDayWiseData(
  String startDayId,
  String endDayId,
  String outletId,
) async {
  // Add your function code here!
  // Add your function code here!

  List<dynamic> docRecord = [];
  bool flag = false;
  List<String> dayIds = [];
  List<dynamic> finalList = [];
  print("both Day ids:");
  print(endDayId);
  print(startDayId);
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('OUTLET')
      .doc(outletId)
      .collection('SHIFT')
      .where('dayId', isGreaterThanOrEqualTo: startDayId.toString())
      .where('dayId', isLessThanOrEqualTo: endDayId.toString())
      .get()
      .then((value) => value);
  if (querySnapshot.size == 0) {
    print('No matching documents.');
  } else {
    int len = querySnapshot.docs.length;
    int count = 0;

    querySnapshot.docs.forEach((doc) {
      docRecord.add({
        "dayId": doc["dayId"],
        "shiftCount": 1,
        "billCount": doc["billCount"],
        "totalSale": doc["totalSale"],
        "netSale": doc["totalSale"] - doc["deliveryCharges"] + doc["discount"]
      });
    });
    //docRecord.sort();
    print(docRecord.length);

    if (docRecord.length > 0) {
      docRecord.forEach((element) {
        if (finalList.length == 0) {
          finalList.add(element);
        } else {
          int index = finalList
              .indexWhere((element1) => element1["dayId"] == element["dayId"]);
          if (index == -1) {
            finalList.add(element);
          } else {
            finalList[index]["shiftCount"] += 1;
            finalList[index]["billCount"] += element["billCount"];
            finalList[index]["totalSale"] += element["totalSale"];
            finalList[index]["netSale"] += element["netSale"];
          }
        }
      });
    }
  }
  return finalList;
}
