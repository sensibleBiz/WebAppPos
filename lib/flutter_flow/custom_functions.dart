import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

int getcreatedDate() {
  int timestamp = DateTime.now().millisecondsSinceEpoch;

  print(timestamp);

  return timestamp;
}

List<OutletLeadsRecord> groupByCitiesCopy3(List<OutletLeadsRecord> list) {
  List<OutletLeadsRecord> returnList = [];

  for (var record in list) {
    print(record.city);
    if (returnList.length > 0) {
      int count = 0;
      bool flag = false;

      for (int i = 0; i < returnList.length; i++) {
        count++;
        if (record.city == returnList[i].city) {
          flag = true;
          break;
        } else {
          if (count == returnList.length && flag == false) {
            returnList.add(record);
          }
        }
      }
    } else {
      returnList.add(record);
    }
  }
  //returnList.sort((a, b) => ,)
  returnList.sort((a, b) => a.city.compareTo(b.city));
  print(returnList);
  return returnList;
}

String? monthCopy(int date) {
  DateTime date = DateTime.now();
  //var day;
  //if (date.day.toString().length == 1) {
  //day = "0" + date.day.toString();
  //} else {
  //  day = date.day.toString();
  //}
  var month;
  if (date.month.toString().length == 1) {
    month = "0" + date.month.toString();
  } else {
    month = date.month.toString();
  }
  var invNum = date.year.toString() + "-" + month;
  print(invNum);
  return invNum;
}

List<LeadsRecord> groupByCitiesCopy2(List<LeadsRecord> list) {
  List<LeadsRecord> returnList = [];

  for (var record in list) {
    print(record.city);
    if (returnList.length > 0) {
      int count = 0;
      bool flag = false;

      for (int i = 0; i < returnList.length; i++) {
        count++;
        if (record.city == returnList[i].city) {
          flag = true;
          break;
        } else {
          if (count == returnList.length && flag == false) {
            returnList.add(record);
          }
        }
      }
    } else {
      returnList.add(record);
    }
  }
  //returnList.sort((a, b) => ,)
  returnList.sort((a, b) => a.city.compareTo(b.city));
  print(returnList);
  return returnList;
}

DocumentReference getLeadDocRefFromIdCopy(
  String? id,
  String outletId,
) {
  // Add your function code here!

  return FirebaseFirestore.instance.doc('/OUTLET/$outletId/OUTLET_LEADS/$id');
}

int yesterdayCopy() {
  // get yesterday value in integer
  var now = DateTime.now();
  var yesterday = DateTime(now.year, now.month, now.day - 1);
  return yesterday.millisecondsSinceEpoch;
}

List<dynamic> groupByCitiesReportCopy(
  List<LeadsManagementRecord> listLeadMange,
  List<OutletLeadsRecord> listLead,
) {
  List<dynamic> returnList = [];

  for (var record in listLeadMange) {
    // print(record.city);
    if (returnList.length > 0) {
      int count = 0;
      bool flag = false;

      for (int i = 0; i < returnList.length; i++) {
        count++;
        if (record.city == returnList[i]["city"]) {
          flag = true;
          break;
        } else {
          if (count == returnList.length && flag == false) {
            returnList.add({
              "city": record.city,
              "stage": record.stage,
              "status": record.status,
              "id": record.city,
            });
            // returnList.add(record);
          }
        }
      }
    } else {
      //returnList.add(record);
      returnList.add({
        "city": record.city,
        "stage": record.stage,
        "status": record.status,
        "id": record.city,
      });
    }
  }

  for (var recordLead in listLead) {
    //  print(recordLead.city);
    if (returnList.length > 0) {
      int count = 0;
      bool flag = false;

      for (int i = 0; i < returnList.length; i++) {
        count++;
        if (recordLead.city == returnList[i]["city"]) {
          flag = true;
          break;
        } else {
          if (count == returnList.length && flag == false) {
            // returnList.add(recordLead);
            returnList.add({
              "city": recordLead.city,
              "stage": recordLead.status,
              "status": recordLead.status,
              "id": recordLead.city,
            });
          }
        }
      }
    } else {
      // returnList.add(recordLead);
      returnList.add({
        "city": recordLead.city,
        "stage": recordLead.status,
        "status": recordLead.status,
        "id": recordLead.city,
      });
    }
  }
  //returnList.sort((a, b) => a.city.compareTo(b.city));
  //print(returnList);
  return returnList;
}

List<LeadsManagementRecord> groupByCitiesCopy(
    List<LeadsManagementRecord> list) {
  List<LeadsManagementRecord> returnList = [];

  for (var record in list) {
    print(record.city);
    if (returnList.length > 0) {
      int count = 0;
      bool flag = false;

      for (int i = 0; i < returnList.length; i++) {
        count++;
        if (record.city == returnList[i].city) {
          flag = true;
          break;
        } else {
          if (count == returnList.length && flag == false) {
            returnList.add(record);
          }
        }
      }
    } else {
      returnList.add(record);
    }
  }
  returnList.sort((a, b) => a.city.compareTo(b.city));
  // print(returnList);
  return returnList;
}

String getYearId() {
  // Add your function code here!
  DateTime date = DateTime.now();
  // var day;
  //if (date.day.toString().length == 1) {
  // day = "0" + date.day.toString();
  //} else {
  // day = date.day.toString();
  //}
  // var month;
  //if (date.month.toString().length == 1) {
  //month = "0" + date.month.toString();
  //}// else {
  //  month = date.month.toString();
  //}
  var invNum = date.year.toString();
  print(invNum);
  return invNum;
}

String getDocIdFromDocRefLeadDemo(DocumentReference? docRef) {
  String id = docRef!.id;
  return id;
}

String getMonthId() {
  // Add your function code here!
  DateTime date = DateTime.now();
  //var day;
  //if (date.day.toString().length == 1) {
  //day = "0" + date.day.toString();
  //} else {
  //  day = date.day.toString();
  //}
  var month;
  if (date.month.toString().length == 1) {
    month = "0" + date.month.toString();
  } else {
    month = date.month.toString();
  }
  var invNum = date.year.toString() + "-" + month;
  print(invNum);
  return invNum;
}

List<dynamic> dealerChartDataCopy(
  List<LeadsManagementRecord> docs,
  String filter,
) {
  List<dynamic> list1 = [];
  String stage;
  int acount = 0, fcount = 0, ccount = 0, lcount = 0;
  if (docs.length > 0) {
    if (filter == "today") {
      for (int i = 0; i <= docs.length - 1; i++) {
        if (docs[i].date == dateFormat(DateTime.now())) {
          stage = docs[i].stage;
          print(stage);
          switch (stage) {
            case "assigned":
              acount++;
              break;
            case "followup":
              fcount++;
              break;
            case "completed":
              ccount++;
              break;
            case "lost":
              lcount++;
              break;
          }
        }
      }

      list1 = [
        {"label": "Assigned", "value": acount},
        {"label": "Followup", "value": fcount},
        {"label": "Completed", "value": ccount},
        {"label": "Lost", "value": lcount}
      ];
    } else if (filter == "cmonth") {
      for (int i = 0; i <= docs.length - 1; i++) {
        if (docs[i].monthId == monthCopy(1)) {
          stage = docs[i].stage;
          print(stage);
          switch (stage) {
            case "assigned":
              acount++;
              break;
            case "followup":
              fcount++;
              break;
            case "completed":
              ccount++;
              break;
            case "lost":
              lcount++;
              break;
          }
        }
      }

      list1 = [
        {"label": "Assigned", "value": acount},
        {"label": "Followup", "value": fcount},
        {"label": "Completed", "value": ccount},
        {"label": "Lost", "value": lcount}
      ];
    } else if (filter == "lmonth") {
      for (int i = 0; i <= docs.length - 1; i++) {
        if (docs[i].monthId == getLastMonthId(1)) {
          stage = docs[i].stage;
          print(stage);
          switch (stage) {
            case "assigned":
              acount++;
              break;
            case "followup":
              fcount++;
              break;
            case "completed":
              ccount++;
              break;
            case "lost":
              lcount++;
              break;
          }
        }
      }

      list1 = [
        {"label": "Assigned", "value": acount},
        {"label": "Followup", "value": fcount},
        {"label": "Completed", "value": ccount},
        {"label": "Lost", "value": lcount}
      ];
    }
  }

  print(list1);
  return list1;
}

List<dynamic> demoListLastObjCopy(List<dynamic> list) {
  // return last obj of list
  List<dynamic> listCopy = [];
  if (list.isNotEmpty) {
    listCopy.add(list.last);
  }
  return listCopy;
}

String toSmallLetterCopy(String? value) {
  return (value!.toLowerCase());
  // Add your function code here!
}

List<dynamic> stringToList(String? value) {
  List<String> xList;
  value = value!.replaceAll("{", '');
  value = value.replaceAll("}", '');
  xList = value.split(',');

  List<dynamic> yList = [];

  for (int i = 0; i < xList.length; i++) {
    var z = xList[i].split(':');
    yList.add({"title": z[0], "value": z[1]});
  }

  return yList;
}

String getDocIdFromDocRef(DocumentReference? docRef) {
  String id = docRef!.id;
  return id;
}

String getDocIdFromDocRefUnit(DocumentReference? docRef) {
  String id = docRef!.id;
  return id;
}

String getDocIdFromDocRefTax(DocumentReference? docRef) {
  String id = docRef!.id;
  return id;
}

String getDocIdFromDocRefServicePoint(DocumentReference? docRef) {
  String id = docRef!.id;
  return id;
}

String getDocIdFromDocRefCategoryMaster(DocumentReference? docRef) {
  String id = docRef!.id;
  return id;
}

String getDocIdFromDocRefSubCategoryMaster(DocumentReference? docRef) {
  String id = docRef!.id;
  return id;
}

String getDocIdFromDocRefProductMaster(DocumentReference? docRef) {
  String id = docRef!.id;
  return id;
}

String getDocIdFromDocRefLanguages(DocumentReference? docRef) {
  String id = docRef!.id;
  return id;
}

String getDocIdFromDocRefPaymentMode(DocumentReference? docRef) {
  String id = docRef!.id;
  return id;
}

String getLeadDocIdFromDocRef(DocumentReference? docRef) {
  String id = docRef!.id;
  return id;
}

String getDocIdFromDocRefUserRoleType(DocumentReference? docRef) {
  String id = docRef!.id;
  return id;
}

String getDocIdFromDocRefpremisess(DocumentReference? docRef) {
  String id = docRef!.id;
  return id;
}

String toCapitalLetter(String? value) {
  return (value!.toUpperCase());
  // Add your function code here!
}

String stringToJSON(
  String? para1,
  String? para2,
  String? para3,
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

DocumentReference getCatDocRefFromId(String? id) {
  // Add your function code here!

  return FirebaseFirestore.instance.doc('/CATEGORY_MASTER/$id');
}

DocumentReference getSubDocRefFromId(String? id) {
  // Add your function code here!

  return FirebaseFirestore.instance.doc('/SUBSCRIPTION/$id');
}

String getCatname(DocumentReference? docRef) {
  return docRef!.id;
  // Add your function code here!
}

int getUpdatedDate() {
  // Add your function code here!
  int timestamp = DateTime.now().millisecondsSinceEpoch;
  print("timestamp");
  print(timestamp);
  return timestamp;
}

String activeInactive(bool? data) {
  // Add your function code here!
  if (data!) {
    return "Active";
  } else {
    return "Inactive";
  }
}

bool activeDevice(bool? data) {
  // Add your function code here!
  if (data!) {
    print("DeActivate");
    return false;
  } else {
    print("Activate");
    return true;
  }
}

double toPercentageNumber(double? value) {
  // Add your function code here!
  return (value!.toDouble());
}

String getCreateDate() {
  // Add your function code here!
  var date = DateTime.now().toString();
  var dateParse = DateTime.parse(date);
  var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
  return formattedDate.toString();
}

DocumentReference getLeadDocRefFromId(String? id) {
  // Add your function code here!

  return FirebaseFirestore.instance.doc('/LEADS/$id');
}

String listToJson(List<String>? data) {
  // Add your function code here!

  return data.toString();
}

String jsonListToJsonString(List<dynamic> data) {
  var obj = [];

  data.forEach((element) {
    obj.add({element["title"]: element["value"]});
  });
  return obj.toString();
}

String getDocIdFromDocRefSubscriptionType(DocumentReference? docRef) {
  String id = docRef!.id;
  return id;
}

String getDocIdFromDocRefAboutUs(DocumentReference? docRef) {
  String id = docRef!.id;
  return id;
}

String getDocIdFromDocRefContactUs(DocumentReference? docRef) {
  String id = docRef!.id;
  return id;
}

String getDocIdFromDocRefTnC(DocumentReference? docRef) {
  String id = docRef!.id;
  return id;
}

String getDocIdFromDocRefCategory(DocumentReference? docRef) {
  // Add your function code here!
  String id = docRef!.id;
  return id;
}

String getDocIdFromDocRefPremises(DocumentReference? docRef) {
  // Add your function code here!
  String id = docRef!.id;
  return id;
}

String getDocIdFromDocRefServicePointOutlet(DocumentReference? docRef) {
  // Add your function code here!
  String id = docRef!.id;
  return id;
}

String getDocIdFromDocRefProduct(DocumentReference? docRef) {
  // Add your function code here!
  String id = docRef!.id;
  return id;
}

DocumentReference getUnitTypeDocRefFromId(String? id) {
  // Add your function code here!
  return FirebaseFirestore.instance.doc('/UNIT_TYPE/$id');
}

DocumentReference getCatDocRefFroMId(
  String? id,
  DocumentReference? parentId,
) {
  // Add your function code here!
  var docId = parentId!.id;
  var subId = id;

  return FirebaseFirestore.instance.doc('/OUTLET/' + docId + '/CATEGORY/$id');
}

DocumentReference getProdoctMasterDocRefFromId(String? id) {
  // Add your function code here!
  return FirebaseFirestore.instance.doc('/PRODUCT_MASTER/$id');
}

DocumentReference getTaxDocRefFromId(String? id) {
  // Add your function code here!
  return FirebaseFirestore.instance.doc('/TAX_MASTER/$id');
}

DocumentReference getSubCatDocRefFromIdCopy(String? id) {
  // Add your function code here!
  return FirebaseFirestore.instance.doc('/SUB_CATEGORY/$id');
}

DocumentReference getServicePointOutletDocRefFromId(
  String? id,
  DocumentReference? parentId,
) {
  // Add your function code here!
  var docId = parentId!.id;
  return FirebaseFirestore.instance
      .doc('/OUTLET/' + docId + '/SERVICE_POINT_OUTLET/$id');
}

String getDocIdFromDocRefUserAccount(DocumentReference? docRef) {
  // Add your function code here!
  String id = docRef!.id;
  return id;
}

String subscriptionDays(
  DateTime? dateParameter1,
  int? dateParameter2,
) {
  // Add your function code here!
  //  DateTime _today = DateTime.now();
  //DateTime _cDate = DateTime.parse('2023-05-26');

  //var difference = _cDate.difference(_today).inDays;
  // String value = difference.toString();

  final DateTime _today = dateParameter1!;
  final DateTime _rDate = DateTime.fromMillisecondsSinceEpoch(dateParameter2!);

  var difference = _rDate.difference(_today).inDays;
  String value = difference.toString();

  return value;
}

String milisecToTimestamp(int? dateInNumber) {
  if (dateInNumber != null) {
    DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(dateInNumber!);
    String dateTime = tsdate.year.toString() +
        "/" +
        tsdate.month.toString() +
        "/" +
        tsdate.day.toString();
    print(dateTime);
    String fdatetime = DateFormat('dd-MMM-yyy').format(tsdate);
    return fdatetime;
  } else {
    String fdatetime = "00-000-0000";
    return fdatetime;
  }
}

int genSrno(int? value) {
  // Add your function code here!
  return (value!! + 1);
}

String getDocIdFromDocRefRecipe(DocumentReference? docRef) {
  // Add your function code here!
  String id = docRef!.id;
  return id;
}

String getDayId() {
  // Add your function code here!
  DateTime date = DateTime.now();
  var day;
  if (date.day.toString().length == 1) {
    day = "0" + date.day.toString();
  } else {
    day = date.day.toString();
  }
  var month;
  if (date.month.toString().length == 1) {
    month = "0" + date.month.toString();
  } else {
    month = date.month.toString();
  }
  var invNum = date.year.toString() + "-" + month + "-" + day;
  print(invNum);
  return invNum;
}

String paymentModeStrToJson(
  String str,
  String index,
) {
  // Add your function code here!
  String data = str;
  List<dynamic> yList = [];
  List<dynamic> zList = [];
  Map<String, dynamic> map;
  String result = "";
  var x = data.replaceAll('{', " ").trim();
  var y = x.replaceAll('}', " ").trim();
  yList = y.split(',');
  for (int j = 0; j < yList.length; j++) {
    map = {
      "title": yList[j].split(':')[0].toString(),
      "value": yList[j].split(':')[1]
    };
    print(map);
    zList.add(map);
  }
  zList.forEach((item) {
    if (item["title"] == "\"" + index + "\"") {
      result = item["value"];
    }
  });
  return result;
}

List<String>? outletsExists(UserProfileRecord? doc) {
  List<String> list = [];
  /* if (doc!.outlets.isEmpty) {
    list.add("null");
    return list;
  } else {
    list = doc.outlets.toList();
    return list;
  }*/
  return doc!.outlets!.toList();
  // Add your function code here!
}

String? getOutletIdByRef(DocumentReference? doc) {
// Add your function code here!
  return doc!.id;
}

String getOutletIdbyRef(DocumentReference? doc) {
  return doc!.id;
}

String? getAuthorName(String rawAuthorName) {
  return rawAuthorName.toLowerCase();
}

List<String>? loginUserOutletDocumentRef(UserProfileRecord? doc) {
  List<String> list = [];

  return doc!.outlets!.toList();
}

List<dynamic> getProList(
  List<dynamic> list,
  String? type,
) {
  List<dynamic> tempList = [];
  Map map = new Map();

  if (type == "p") {
    tempList = list[0]["allProducts"];
  } else {
    tempList = list[0]["details"];
  }
  print(tempList);
  return tempList;
}

String getToday(DateTime dateTime) {
  var day, month;
  day = dateTime.day.toString();
  month = dateTime.month.toString();

  print(dateTime);

  var invNum = dateTime.year.toString() +
      "-" +
      (month.length < 2 ? "0" + month : month).toString() +
      "-" +
      (day.length < 2 ? "0" + day : day).toString();

  print(invNum);
  return invNum.toString();
}

String getyesterday() {
  final DateTime now = DateTime.now();
  final DateTime yesterday = DateTime(now.year, now.month, now.day - 1);

  var day, month;
  day = yesterday.day.toString();
  month = yesterday.month.toString();
  print(yesterday);

  var invNum = yesterday.year.toString() +
      "-" +
      (month.length < 2 ? "0" + month : month).toString() +
      "-" +
      (day.length < 2 ? "0" + day : day).toString();

  print(invNum);
  return invNum.toString();
}

String getCurrentMonth(String? index) {
  DateTime currentDate = DateTime.now();
  DateTime firstDay, lastDay;
  String dayId = "";

  firstDay = DateTime.utc(currentDate.year, currentDate.month, 1);
  lastDay = DateTime.utc(
    currentDate.year,
    currentDate.month + 1,
  ).subtract(Duration(days: 1));

  String day;
  String month;

  if (index == "start") {
    print(firstDay);
    day = firstDay.day.toString().length == 1
        ? "0" + firstDay.day.toString()
        : firstDay.day.toString();
    month = firstDay.month.toString().length == 1
        ? "0" + firstDay.month.toString()
        : firstDay.month.toString();

    dayId = firstDay.year.toString() +
        "-" +
        month.toString() +
        "-" +
        day.toString();
    print("first :");
    print(dayId.toString());
  } else if (index == "end") {
    print(lastDay);
    day = lastDay.day.toString().length == 1
        ? "0" + lastDay.day.toString()
        : lastDay.day.toString();
    month = lastDay.month.toString().length == 1
        ? "0" + lastDay.month.toString()
        : lastDay.month.toString();
    dayId = firstDay.year.toString() +
        "-" +
        month.toString() +
        "-" +
        day.toString();
    print("Last :");
    print(dayId.toString);
  }

  return dayId.toString();
}

String getDocIdFromDocRefInvoice(DocumentReference docRef) {
  String id = docRef.id;
  print(id);
  return id;
}

String getTime(int? dateInNumber) {
  DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(dateInNumber!);
  String datetime = DateFormat('dd/MM/yyyy hh:mm a').toString();

  print(datetime);
  String fdatetime = DateFormat('dd/MM/yyyy hh:mm a').format(tsdate);

  // DateTime date;
  return fdatetime;
}

String toCapitalLetter1(String? value) {
  return (value!.toUpperCase());
}

String? leadsReq(String? req) {
  String? res;
  //res = (req!.substring(0, req!.indexOf('.')));
  req!.replaceAll("<br>", " ");

  res = (req!.indexOf('.') == -1 ? req! : req!.substring(0, req!.indexOf('.')));
  return res;
}

int timestampToMili(DateTime? date) {
  return date!.millisecondsSinceEpoch;
}

int callDuration(
  String? min,
  String? sec,
) {
  // combine two integer value with :
  return int.parse('$min:$sec');
}

int stringToInteger(String? val1) {
  // combine two string with : and convert then to integer
  return int.parse('$val1');
}

String dateToTime(int? date) {
  DateTime time = DateTime.fromMillisecondsSinceEpoch(date!);

  String d = time.hour.toString() +
      " : " +
      time.minute.toString() +
      " : " +
      time.second.toString();

  // print(d);

  return d;
}

DocumentReference getRef(
  dynamic list,
  String outletId,
  int flag,
) {
  String docId;

  if (flag == 0) {
    docId = list["id"];
  } else {
    docId = list[0]["id"];
  }

  print(docId);
  print(outletId);
  return FirebaseFirestore.instance
      .doc('/OUTLET/' + outletId + '/LEADS_MANAGEMENT/$docId');
}

int yesterday() {
  // get yesterday value in integer
  var now = DateTime.now();
  var yesterday = DateTime(now.year, now.month, now.day - 31);
  return yesterday.millisecondsSinceEpoch;
}

String dateFormat(DateTime? date) {
  var newFormat = DateFormat("dd-MM-yyyy");
  String newDateInString = newFormat.format(date!);
  return newDateInString;
}

String statusForStage(String status) {
  String stage = "";
  if (status.toUpperCase() == "ASSIGNED" ||
      status.toUpperCase() == "RINGING" ||
      status.toUpperCase() == "CALLED" ||
      status.toUpperCase() == "CALL PENDING" ||
      status.toUpperCase() == "DEMO SCHEDULED" ||
      status.toUpperCase() == "DEMO PENDING") {
    stage = "assigned";
  } else if (status == "FOLLOWUP" ||
      status.toUpperCase() == "DEMO DONE" ||
      status.toUpperCase() == "DEMO RESCHEDULED" ||
      status.toUpperCase() == "FOLLOWUP" ||
      status.toUpperCase() == "HOLD") {
    stage = "followup";
  } else if (status.toUpperCase() == "COMPLETED" ||
      status.toUpperCase() == "INSTALLATION") {
    stage = "completed";
  } // else  {
  // stage = "lost";
  // }
  else if (status.toUpperCase() == "LOST") {
    stage = "lost";
  }
  print(stage);
  print(status);
  return stage;
}

List<String> dropdownStatusList(String stage) {
  List<String> list = [];

  if (stage.toUpperCase() == "ASSIGNED") {
    list.add("ASSIGNED");
    list.add("RINGING");
    list.add("CALLED");
    list.add("CALL BACK");
    list.add("CALL PENDING");
    list.add("DEMO SCHEDULED");
    list.add("DEMO PENDING");
    list.add("DEMO DONE");
    list.add("COMPLETED");

    list.add("LOST");
    // print(list);
  } else if (stage.toUpperCase() == "FOLLOWUP") {
    list.add("DEMO DONE");
    list.add("DEMO RESCHEDULED");
    list.add("FOLLOWUP");
    list.add("HOLD");
    list.add("INSTALLATION");
    list.add("COMPLETED");
    list.add("LOST");
    // print(list);
  } else if (stage.toUpperCase() == "COMPLETED") {
    list.add("COMPLETED");
    list.add("LOST");

    //  print(list);
  } else if (stage.toUpperCase() == "LOST") {
    list.add("LOST");

    //  print(list);
  }
  return list;
}

dynamic generateTaglDetailsJson(
  String leadTagName,
  int code,
  bool isDeleted,
  String type,
) {
  Map<String, dynamic> obj = {
    "leadTagName": leadTagName,
    "code": code,
    "isDeleted": isDeleted,
    "type": type,
  };
  print(obj);
  return obj;
}

int callLogDiff(
  int checkInTime,
  int checkOutTime,
) {
  // return check in and checkout time diffference in minut
  var checkIn = DateTime.fromMillisecondsSinceEpoch(checkInTime);
  var checkOut = DateTime.fromMillisecondsSinceEpoch(checkOutTime);
  var difference = checkOut.difference(checkIn);
  return difference.inMinutes;
}

DemoListStruct demoListLastObj(List<DemoListStruct> list) {
  // return last object of List
  DemoListStruct demoListStruct = DemoListStruct();
  if (list.length > 0) {
    demoListStruct = list[list.length - 1];
  }
  return demoListStruct;
}

String? pathTostring(String path) {
  return path;
}

dynamic docToJson(LeadsManagementRecord leadMdoc) {
  List<dynamic> list = [];
  //list.add(leadMdoc);
  list.add({"id": leadMdoc.id, "status": leadMdoc.status});
  // print("docToJson");

  // print(list[0]["id"]);

  return list;
}

List<LeadsManagementRecord> filterTagName(
  List<LeadsManagementRecord> list,
  String type,
) {
  List<LeadsManagementRecord> returnList = [];
  List<LeadTagListStruct> list1;
  bool flag;
  int count = 0;

  for (int i = 0; i < list.length; i++) {
    print("1");
    list1 = list[i].leadTag;
    print(list[i].leadTag);
    for (int j = 0; j < list1.length; j++) {
      print("2");
      count++;
      if (type == list1[j].leadTagName) {
        print("3");
        returnList.add(list[i]);
        flag = true;
        print(list1[j].leadTagName);
        print(list[i]);
      }
      print("end if");
    }
    print("end for j");
  }
  print("end of i");
  print(returnList);
  return returnList;
}

String? getLastMonthId(int date) {
  DateTime date = DateTime.now();
  //var day;
  //if (date.day.toString().length == 1) {
  //day = "0" + date.day.toString();
  //} else {
  //  day = date.day.toString();
  //}
  var month;
  var x = date.month - 1;
  if (x.toString().length == 1) {
    month = "0" + x.toString();
  } else {
    month = x.toString();
  }
  var invNum = date.year.toString() + "-" + month;
  print(invNum);
  return invNum;
}

int tommarow() {
  // get tommarow date in integer
  var now = new DateTime.now();
  var tommarow = new DateTime(now.year, now.month, now.day + 1);
  return tommarow.millisecondsSinceEpoch;
}

int getYest(int selectedDate) {
  // get yesturday form selected date
  var date = DateTime.fromMillisecondsSinceEpoch(selectedDate);
  var yest = date.subtract(Duration(days: 1));
  return yest.millisecondsSinceEpoch;
}

int getTommorrow(int selectedDate) {
  // get tommorrow from selected date
  DateTime date = DateTime.fromMillisecondsSinceEpoch(selectedDate);
  DateTime tommorrow = date.add(Duration(days: 1));
  return tommorrow.millisecondsSinceEpoch;
}

String count(List<LeadsManagementRecord> docList) {
  return docList.length.toString();
}

List<LeadsRecord> groupByCities(List<LeadsRecord> list) {
  List<LeadsRecord> returnList = [];

  for (var record in list) {
    print(record.city);
    if (returnList.length > 0) {
      int count = 0;
      bool flag = false;

      for (int i = 0; i < returnList.length; i++) {
        count++;
        if (record.city == returnList[i].city) {
          flag = true;
          break;
        } else {
          if (count == returnList.length && flag == false) {
            returnList.add(record);
          }
        }
      }
    } else {
      returnList.add(record);
    }
  }
  //returnList.sort((a, b) => ,)
  returnList.sort((a, b) => a.city.compareTo(b.city));
  print(returnList);
  return returnList;
}

List<dynamic> groupByCitiesReport(
  List<LeadsManagementRecord> listLeadMange,
  List<LeadsRecord> listLead,
) {
  List<dynamic> returnList = [];

  for (var record in listLeadMange) {
    // print(record.city);
    if (returnList.length > 0) {
      int count = 0;
      bool flag = false;

      for (int i = 0; i < returnList.length; i++) {
        count++;
        if (record.city == returnList[i]["city"]) {
          flag = true;
          break;
        } else {
          if (count == returnList.length && flag == false) {
            returnList.add({
              "city": record.city,
              "stage": record.stage,
              "status": record.status,
              "id": record.city,
            });
            // returnList.add(record);
          }
        }
      }
    } else {
      //returnList.add(record);
      returnList.add({
        "city": record.city,
        "stage": record.stage,
        "status": record.status,
        "id": record.city,
      });
    }
  }

  for (var recordLead in listLead) {
    //  print(recordLead.city);
    if (returnList.length > 0) {
      int count = 0;
      bool flag = false;

      for (int i = 0; i < returnList.length; i++) {
        count++;
        if (recordLead.city == returnList[i]["city"]) {
          flag = true;
          break;
        } else {
          if (count == returnList.length && flag == false) {
            // returnList.add(recordLead);
            returnList.add({
              "city": recordLead.city,
              "stage": recordLead.status,
              "status": recordLead.status,
              "id": recordLead.city,
            });
          }
        }
      }
    } else {
      // returnList.add(recordLead);
      returnList.add({
        "city": recordLead.city,
        "stage": recordLead.status,
        "status": recordLead.status,
        "id": recordLead.city,
      });
    }
  }
  //returnList.sort((a, b) => a.city.compareTo(b.city));
  //print(returnList);
  return returnList;
}

String? countStage(
  List<dynamic> jsonList,
  String stage,
  String city,
) {
  print(jsonList);
  int total = 0;
  for (int i = 0; i < jsonList.length; i++) {
    if (stage != 0) {
      if (jsonList[i]["city"] == city && jsonList[i]["stage"] == stage) {
        total = total + 1;
      }
    } else {
      if (jsonList[i]["city"] == city) {
        total = total + 1;
      }
    }
  }

  return total.toString();
}

int returnIndex(int index) {
  return index + 1;
}

String? uRLtoString(String? vidurl) {
  // convert video path to string
  return vidurl?.toString();
}

int getcode(List<UserManualRecord> list) {
  int nextCode;
  if (list!.isNotEmpty) {
    list.sort((a, b) => b.code!.compareTo(a.code!));
    int maxCode = list[0].code!;
    print(list);
    nextCode = maxCode + 1;
  } else {
    nextCode = 1;
  }
  print(nextCode);
  return nextCode;
}

List<String>? stringtourl(List<String>? stringurl) {
  // convert string imgurl to image path
  if (stringurl == null) {
    return null;
  }
  return stringurl.map((url) => url).toList();
}

double upiTotalcount(String jsonString) {
  // Extract values from the JSON
  Map<String, dynamic> jsonData = json.decode(jsonString);
  double googlePay = jsonData['googlepay'] as double;
  double phonePe = jsonData['phonepe'] as double;
  double paytm = jsonData['paytm'] as double;

// Calculate the total sum
  double total = googlePay + phonePe + paytm;

// Use the 'total' variable as needed
  print('Total of Google Pay, PhonePe, and Paytm: $total');
  return total;
}

String? millSecondToDate(String? milliSecondDate) {
  if (milliSecondDate == null) {
    return null;
  }

  try {
    int milliseconds = int.parse(milliSecondDate);
    DateTime date = DateTime.fromMillisecondsSinceEpoch(milliseconds);
    return date.toString(); // Or customize formatting as needed
  } catch (e) {
    return null; // Handle invalid input gracefully
  }
}

int? userDocToJsonNew(
  UserProfileRecord doc,
  String index,
) {
  int? result;
  List<dynamic> objList = [];
  if (doc != null) {
    List<dynamic> temp = [];
    doc.permissionList!.forEach((item) {
      if (index == item.title) {
        result = item.value;
      }
      temp.add({"title": item.title, "value": item.value});
    });
    objList.add({"permissionList": temp});
    print(objList[0]);
  }
  return result;
}

DateTime nextDay(String dateTime) {
  // return next day date
  DateTime parsedDateTime = DateTime.parse(dateTime);
  DateTime nextDay = parsedDateTime.add(Duration(days: 1));
  return nextDay;
}

int currentMonth(String index) {
  DateTime curDate = new DateTime.now();
  var first, last;
  int firstInMilli, lastInMilli;
  int result = 0;
  if (index == "first") {
    first = DateTime(curDate.year, curDate.month, 1);

    firstInMilli = first.millisecondsSinceEpoch;
    result = firstInMilli;
  } else if (index == "last") {
    last = (curDate.month < 12)
        ? new DateTime(curDate.year, curDate.month + 1, 1)
        : new DateTime(curDate.year + 1, 1, 1);
    lastInMilli = last.millisecondsSinceEpoch;
    result = lastInMilli;
  }
  return result;
}

String? imgtostring(String? link) {
  return link;
}

List<dynamic> dealerChartData(
  List<LeadsManagementRecord> docs,
  String id,
) {
  List<dynamic> list1 = [];
  String stage;
  int acount = 0, fcount = 0, ccount = 0, lcount = 0;

  if (docs.length > 0) {
    for (int i = 0; i <= docs.length - 1; i++) {
      print("assignedto ");
      print(docs[i].assignedTo);
      if (docs[i].assignedTo == id) {
        stage = docs[i].stage;
        print(stage);
        switch (stage) {
          case "assigned":
            acount++;
            break;
          case "followup":
            fcount++;
            break;
          case "completed":
            ccount++;
            break;
          case "lost":
            lcount++;
            break;
        }
      }
    }
  }

  list1 = [
    {"label": "Assigned", "value": acount},
    {"label": "Followup", "value": fcount},
    {"label": "Completed", "value": ccount},
    {"label": "Lost", "value": lcount}
  ];
  print(list1);
  return list1;
}

String? createDealerCode() {
  var code;
  int curDateTimeInMili = new DateTime.now().millisecondsSinceEpoch;
  code = "SCSPLDC-" + curDateTimeInMili.toString();

  return code;
}

List<dynamic> top3Products(List<InvoiceRecord> invoice) {
  List<dynamic> list = [];

  List<dynamic> prdList = [];
  for (int i = 0; i < invoice.length; i++) {
    invoice[i].productList.forEach((item) {
      var index = prdList.indexOf(item.id);
      if (index == -1) {
        prdList.add(invoice[i].productList);
      } else {
        prdList[index]["quantity"] = prdList[index]["quantity"] + item.quantity;
      }
    });
  }
  return list;
}
