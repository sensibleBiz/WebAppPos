import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

int getcreatedDate() {
  int timestamp = DateTime.now().millisecondsSinceEpoch;
  print(timestamp);
  return timestamp;
}

List<dynamic> stringToList(String value) {
  List<String> xList;
  value = value.replaceAll("{", '');
  value = value.replaceAll("}", '');
  xList = value.split(',');

  List<dynamic> yList = [];

  for (int i = 0; i < xList.length; i++) {
    var z = xList[i].split(':');
    yList.add({"title": z[0], "value": z[1]});
  }
  print(yList);
  return yList.toList();
}

String getDocIdFromDocRef(DocumentReference docRef) {
  String id = docRef.id;
  return id;
}

String getDocIdFromDocRefUnit(DocumentReference docRef) {
  String id = docRef.id;
  return id;
}

String getDocIdFromDocRefTax(DocumentReference docRef) {
  String id = docRef.id;
  return id;
}

String getDocIdFromDocRefServicePoint(DocumentReference docRef) {
  String id = docRef.id;
  return id;
}

String getDocIdFromDocRefCategoryMaster(DocumentReference docRef) {
  String id = docRef.id;
  return id;
}

String getDocIdFromDocRefSubCategoryMaster(DocumentReference docRef) {
  String id = docRef.id;
  return id;
}

String getDocIdFromDocRefProductMaster(DocumentReference docRef) {
  String id = docRef.id;
  return id;
}

String getDocIdFromDocRefLanguages(DocumentReference docRef) {
  String id = docRef.id;
  return id;
}

String getDocIdFromDocRefPaymentMode(DocumentReference docRef) {
  String id = docRef.id;
  return id;
}

String getDocIdFromDocRefUserRollType(DocumentReference docRef) {
  String id = docRef.id;
  return id;
}

String toCapitalLetter(String value) {
  return (value.toUpperCase());
  // Add your function code here!
}

String stringToJSON(
  String para1,
  String para2,
  String para3,
) {
  /*var result = '{"English":' +
      para1 +
      ", 'Hindi':" +
      para2 +
      ", 'Marathi':" +
      para3 +
      "}";
  */
  dynamic result;
  result = {
    "English": para1,
    "Hindi": para2,
    "Marathi": para3,
    //  "Tamil": para4,
  };

  // Add your function code here!
  return result.toString();
}

DocumentReference getCatDocRefFromId(String id) {
  // Add your function code here!

  return FirebaseFirestore.instance.doc('/CATEGORY_MASTER/$id');
}

String getCatname(DocumentReference docRef) {
  return docRef.id;
  // Add your function code here!
}

int getUpdatedDate() {
  // Add your function code here!
  int timestamp = DateTime.now().millisecondsSinceEpoch;
  print(timestamp);
  return timestamp;
}
