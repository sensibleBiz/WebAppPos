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

Future<List<dynamic>> filterLeadByDate(
  List<LeadsManagementRecord> leads,
  int startDate,
  int endDate,
) async {
  List<dynamic> list = [];

  Map<String, int> grouped1 = {};

  for (var doc in leads) {
    if (doc.updatedDate >= startDate && doc.updatedDate <= endDate) {
      final category = doc.stage; // Handle missing fields
      if (!grouped1.containsKey(category)) {
        grouped1[category] = 0;
      }
      grouped1[category] = grouped1[category]! + 1;

      // Convert the map into a list of JSON objects
      List<dynamic> jsonList = grouped1.entries
          .map((entry) => {"status": entry.key, "count": entry.value})
          .toList();
      print(jsonList);
      list.add(jsonList);
    }
  }
  return list;
  // Add your function code here!
}
