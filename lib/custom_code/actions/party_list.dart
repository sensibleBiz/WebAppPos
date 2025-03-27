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

Future<dynamic> partyList() async {
  // Add your function code here!
  List<dynamic> partyList = [];

  partyList.add({
    "type": 0,
    "alternateNumber": 0,
    "vehicleNo": 0,
    "refName": 0,
    "adharCardNo": 0,
    "panCardNo": 0,
    "city": 0,
    "postalCode": 0,
    "gender": 0,
    "familySize": 0,
    "anniversary": 0,
    "birthday": 0,
    "credit": 0,
    "oldBalance": 0,
    "creditLimit": 0,
    "proofOfIdentity": 0,
    "firmName": 0,
    "role": 0,
    "extraDetails": 0,
    "firstVisit": 0,
    "lastVisit": 0,
  });
  print(partyList);

  partyList[0]["creditLimit"] = 0;

  FFAppState().tempPartyList = partyList;
}
