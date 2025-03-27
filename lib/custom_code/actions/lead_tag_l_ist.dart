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

Future<List<LeadTagListStruct>> leadTagLIst(List<dynamic> allTagList) async {
  // Add your function code here!
  List<dynamic> itemList = [];
  itemList = allTagList;
  List<LeadTagListStruct> returnList = [];
  LeadTagListStruct struct = LeadTagListStruct();

  for (int j = 0; j < itemList.length; j++) {
    struct = createLeadTagListStruct(
      leadTagName: itemList[j]["leadTagName"],
      code: itemList[j]["code"],
      isDeleted: itemList[j]["isDeleted"],
      type: itemList[j]["type"],
    );

    returnList.add(struct);
    // print(returnList);
  }
  return returnList;
}
