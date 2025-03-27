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

Future<List<dynamic>> leadDocToLeadJson(
    List<LeadsManagementRecord> docs) async {
  List<dynamic> leadDocs = [];
  List<dynamic> leadCount = [];
  int aCount = 0, fCount = 0, cCount = 0, lCount = 0;

  for (int i = 0; i < docs.length; i++) {
    // print(docs[i]);
    // print(docs[i].username);

    leadDocs.add({
      "username": docs[i].username,
      "mobile": docs[i].mobile,
      "status": docs[i].status,
      "area": docs[i].area,
      "city": docs[i].city,
      "state": docs[i].state,
      "source": docs[i].source,
      "comments": docs[i].comments, //"dd-mmm-yyyy  h:MM:ss"),
      "email": docs[i].email,
      "date": docs[i].date,
      "mobileAlt": docs[i].mobileAlt,
      "phone": docs[i].phone,
      "requirement": docs[i].requirement,
      "time": docs[i].time,
      "assignedTo": docs[i].assignedTo,
      "createdDate": docs[i].createdDate,
      "updatedDate": docs[i].updatedDate,
      "businessName": docs[i].businessName,
      "businessType": docs[i].businessType,
      "assignedBy": docs[i].assignedBy,
      "id": docs[i].id,
      "priority": docs[i].priority,
      "leadRefId": docs[i].leadRefId,
      "remarks": docs[i].remarks,
      "stage": docs[i].stage,
    });
    if (docs[i].stage == "assigned") {
      aCount++;
    } else if (docs[i].stage == "followup") {
      fCount++;
    } else if (docs[i].stage == "completed") {
      cCount++;
    } else if (docs[i].stage == "lost") {
      lCount++;
    }
  }
  leadCount.add(
      {"aCount": aCount, "fCount": fCount, "cCount": cCount, "lCount": lCount});
  FFAppState().leadCount = leadCount;
  // Add your function code here!
  return leadDocs;
}
