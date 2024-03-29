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

Future<List<dynamic>> updateLangName(
  String? data,
  String? value,
) async {
  /* // Add your function code here!
  List<dynamic> list = [];

  list.add({"title": data, "value": value});
  FFAppState().names.add({"title": data, "value": value});
  print(list);

  */

  List<dynamic> list = FFAppState().names;
  print("1");
  print(list);
  var flag = false;
  if (list.isNotEmpty) {
    for (int i = 0; i < list.length; i++) {
      if (list[i]["title"] == data) {
        list[i] = {"title": data, "value": value};
        flag = true;
        break;
      }
    }
    if (!flag) {
      list.add({"title": data, "value": value});
    }
  } else {
    list.add({"title": data, "value": value});
  }
  print("2");
  print(list);
  FFAppState().names = list;
  /*list.forEach((x) {
      print(x);
      if (x["data"] == data) {
        x["value"] = value;

        // FFAppState().names.add(x);
        // list.add({"title": x.data, "value": x.value});
        print(FFAppState().names);
        // print(list);
      } else {
        FFAppState().names.add({"title": data, "value": value});
        //list.add({"title": data, "value": value});
        // print(list);
      }
    });
  } else {
    FFAppState().names.add({"title": data, "value": value});
    //ist.add({"title": data, "value": value});
    // print(list);
  }*/

  return FFAppState().names;
}
