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

import 'dart:convert' show utf8;
//import 'package:download/download.dart';

Future xlDownload(List<ProductRecord>? doc) async {
  // Add your function code here!
  doc = doc ?? [];
  String fileContent =
      "code, name, regionalName,  selingPrice, mrpPrice, stockable, weightable";
  doc.asMap().forEach((index, record) => fileContent = fileContent +
      "\n" +
      record.code.toString() +
      "," +
      record.name.toString() +
      "," +
      record.regionalName.toString() +
      "," +
      record.sellingPrice.toString() +
      "," +
      record.mrpPrice.toString() +
      "," +
      record.stockable.toString() +
      "," +
      record.weightable.toString());

  final fileName = "FF" + DateTime.now().toString() + ".xlsx";
  var bytes = utf8.encode(fileContent);
  final stream = Stream.fromIterable(bytes);
// return download(stream, fileName);
}
