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

Future<dynamic> removeDuplicateTagList(LeadTagRecord tagObj) async {
  bool flag = false;
  int count = 0;
  print("Tags");
  print(FFAppState().tagList);
  if (FFAppState().tagList.length == 0) {
    FFAppState().tagList.add(generateTaglDetailsJson(
        tagObj.leadTagName, tagObj.code, tagObj.isDeleted, tagObj.type));
  }
  for (int i = 0; i < FFAppState().tagList.length; i++) {
    if (FFAppState().tagList[i]["leadTagName"] != tagObj.leadTagName) {
      flag = true;
      count++;
    }
    if (flag && count == FFAppState().tagList.length) {
      FFAppState().tagList.add(generateTaglDetailsJson(
          tagObj.leadTagName, tagObj.code, tagObj.isDeleted, tagObj.type));
    }
  }
  print("after Tags");
  print(FFAppState().tagList);
  return FFAppState().tagList;
  // Add your function code here!
}
