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

Future<dynamic> leadCountForChart(List<LeadsManagementRecord> leadDoc) async {
  List<dynamic> temp2 = [];
  List<dynamic> temp = [];
  List<dynamic> temp1 = [];
  int aCount = 0, cCount = 0, lCount = 0;
  for (int i = 0; i < leadDoc.length; i++) {
    if (leadDoc[i].stage == "assigned") {
      aCount++;
    } else if (leadDoc[i].stage == "completed") {
      cCount++;
    } else if (leadDoc[i].stage == "lost") {
      lCount++;
    }
  }

  temp.add({"Assigned", "Completed", "Lost"});
  temp1.add({aCount, cCount, lCount});
  temp2.add({"stages": temp, "values": temp1});

  // Add your function code here!
  return temp2[0];
}
