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
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

int getcreatedDate() {
  int timestamp = DateTime.now().millisecondsSinceEpoch;

  print(timestamp);

  return timestamp;
}

List<LeaveApplicationRecord> getZonewiseLeave(
  List<LeaveApplicationRecord> leaveDocs,
  List<TeamTreeRecord> team,
) {
  List<LeaveApplicationRecord> attendanceList = [];
  final teamUserIds = team.map((t) => t.userProfileId).toSet();

  if (leaveDocs != null) {
    for (final att in leaveDocs) {
      if (teamUserIds.contains(att.userProfileId)) {
        attendanceList.add(att);
      }
    }
  }

  return attendanceList;
}

String getCustmMonthId(DateTime date) {
  // Move to last month
  final lastMonthDate = DateTime(date.year, date.month - 1, 1);

  // Format month with leading zero
  final month = lastMonthDate.month.toString().padLeft(2, '0');

  // Build Month ID
  final monthId = "$month-${lastMonthDate.year}";

  return monthId;
}

List<LeadsManagementRecord> filteredLeadsForReports(
  List<LeadsManagementRecord> leadsDoc,
  String? filterExce,
  String? filterNum,
  String? filterField,
  String? review,
  String? stage,
  String? source,
) {
  if (filterExce!.isNotEmpty) {
    leadsDoc = leadsDoc.where((lead) => lead.assignedTo == filterExce).toList();
    // print(leadsDoc);
  }
  if (review!.isNotEmpty) {
    leadsDoc = leadsDoc.where((lead) => lead.remarks == review).toList();
    //print(leadsDoc);
  }
  if (stage!.isNotEmpty) {
    leadsDoc = leadsDoc.where((lead) => lead.stage == stage).toList();
    //print(leadsDoc);
  }
  if (source!.isNotEmpty) {
    leadsDoc = leadsDoc.where((lead) => lead.source == source).toList();
    //print(leadsDoc);
  }
  if (filterField!.isNotEmpty && filterNum!.isNotEmpty) {
    leadsDoc = leadsDoc.where((lead) {
      switch (filterField) {
        case "Mobile":
          return lead.contact == filterNum || lead.mobile == filterNum;

        case "City":
          return lead.city == filterNum;
        default:
          return false;
      }
    }).toList();
  }

  return leadsDoc;
}

List<TeamTreeDatatypeStruct> addTeamTree(List<TeamTreeRecord> docs) {
  List<TeamTreeDatatypeStruct> returnList = [];

  for (final doc in docs) {
    final struct = createTeamTreeDatatypeStruct(
      id: doc.id,
      username: doc.userName,
      userProfileId: doc.userProfileId,
    );
    returnList.add(struct);
  }

  return returnList;
}

List<CategoryDataTypeStruct> addCategoryList(List<CategoryRecord> docs) {
  List<CategoryDataTypeStruct> returnList = [];

  for (final doc in docs) {
    final struct = createCategoryDataTypeStruct(
      id: doc.id,
      name: doc.name,
    );
    returnList.add(struct);
  }

  return returnList;
}

List<ProductDataTypeStruct> addProductLis(List<ProductRecord> docs) {
  List<ProductDataTypeStruct> returnList = [];

  for (final doc in docs) {
    final struct = createProductDataTypeStruct(
      id: doc.id,
      name: doc.name,
      category: doc.category,
    );
    returnList.add(struct);
  }

  return returnList;
}

List<CityListStruct> addCityList(List<CitiesRecord> docs) {
  List<CityListStruct> returnList = [];
  CityListStruct struct = CityListStruct();
  for (int i = 0; i < docs.length; i++) {
    struct = createCityListStruct(
        id: docs[i].id,
        code: docs[i].code,
        cityName: docs[i].cityName,
        state: docs[i].state);

    returnList.add(struct);
  }

  // print(returnList);

  return returnList;
}

List<StatesStruct> addStatesList(
  List<StateRecord> docs,
  List<String> zone,
) {
  List<StatesStruct> returnList = [];

  for (final doc in docs) {
    if (zone.contains(doc.zone)) {
      final struct = createStatesStruct(
        id: doc.id,
        code: doc.code,
        name: doc.name,
        zone: doc.zone,
      );
      returnList.add(struct);
    }
  }

  return returnList;
}

int lastDays(int day) {
  // get yesterday value in integer
  var now = DateTime.now();
  var yesterday = DateTime(now.year, now.month, now.day - day);
  return yesterday.millisecondsSinceEpoch;
}

List<LeadsManagementRecord> filteredComplaintsForReports(
  List<LeadsManagementRecord> leadsDoc,
  String? filterExce,
  String? filterNum,
  String? filterField,
  String? review,
  String? zone,
  String? stage,
  List<String>? zoneList,
  String? solution,
) {
  // print("***********");
  // print(filterExce);
  // print(filterNum);
  // print(filterField);
  // print(review);
  // print(zone);
  // print(stage);
  // print("***********");
  if (filterExce!.isNotEmpty) {
    leadsDoc = leadsDoc.where((lead) => lead.assignedTo == filterExce).toList();
    // print(leadsDoc);
  }
  if (review!.isNotEmpty) {
    leadsDoc = leadsDoc.where((lead) => lead.remarks == review).toList();
    //print(leadsDoc);
  }
  if (stage!.isNotEmpty) {
    leadsDoc = leadsDoc.where((lead) => lead.stage == stage).toList();
    //print(leadsDoc);
  }
  if (zoneList!.isNotEmpty) {
    print(zoneList);
    leadsDoc = leadsDoc.where((lead) => zoneList.contains(lead.zone)).toList();
  } else {
    if (zone!.isNotEmpty) {
      leadsDoc = leadsDoc.where((lead) => lead.zone == zone).toList();
      // print(leadsDoc);
    }
  }
  if (solution!.isNotEmpty) {
    leadsDoc = leadsDoc.where((lead) {
      final customFields = lead.customFields;
      return customFields.hasSolution() && customFields.solution == solution;
    }).toList();
  }

  if (filterField!.isNotEmpty && filterNum!.isNotEmpty) {
    leadsDoc = leadsDoc.where((lead) {
      switch (filterField) {
        case "Mobile":
          return lead.mobile == filterNum;
        case "Serial":
          return lead.customFields.serial.toString() == filterNum;
        case "Complaint":
          return lead.ticket == filterNum;
        default:
          return false;
      }
    }).toList();
  }

  return leadsDoc;
}

List<dynamic> groupByStateReport(List<LeadsManagementRecord> listLeadMange) {
  // List<dynamic> returnList = [];
  // // print("*********");
  // // print(listLeadMange);
  // for (var record in listLeadMange) {
  //   // print("------------------------------------------ 1");
  //   // print(record.mobile);
  //   // print(record.city);
  //   // print("------------------------------------------1");
  //   if (returnList.length > 0) {
  //     int count = 0;
  //     bool flag = false;

  //     for (int i = 0; i < returnList.length; i++) {
  //       count++;
  //       if (record.state == returnList[i]["state"]) {
  //         flag = true;
  //         break;
  //       } else {
  //         if (count == returnList.length && flag == false) {
  //           returnList.add({
  //             "city": record.city,
  //             "stage": record.stage,
  //             "status": record.status,
  //             "id": record.id,
  //             "state": record.state
  //           });
  //           // returnList.add(record);
  //         }
  //       }
  //     }
  //   } else {
  //     //returnList.add(record);
  //     returnList.add({
  //       "city": record.city,
  //       "stage": record.stage,
  //       "status": record.status,
  //       "id": record.id,
  //       "state": record.state
  //     });
  //   }
  // }
  // print("&&&&&&&&&&&&&&&&&&&&&&&&&&");
  // print(listLead);

  // for (var recordLead in listLead) {
  //   //  print(recordLead.city);
  //   if (returnList.length > 0) {
  //     int count = 0;
  //     bool flag = false;
  //     // print("------------------------------------------2");
  //     // print(recordLead.mobile);
  //     // print(recordLead.city);
  //     // print("------------------------------------------2");

  //     for (int i = 0; i < returnList.length; i++) {
  //       count++;
  //       if (recordLead.state == returnList[i]["state"]) {
  //         flag = true;
  //         break;
  //       } else {
  //         if (count == returnList.length && flag == false) {
  //           // returnList.add(recordLead);
  //           returnList.add({
  //             "city": recordLead.city,
  //             "stage": recordLead.status,
  //             "status": recordLead.status,
  //             "id": recordLead.city,
  //             "state": recordLead.state
  //           });
  //         }
  //       }
  //     }
  //   } else {
  //     // returnList.add(recordLead);
  //     returnList.add({
  //       "city": recordLead.city,
  //       "stage": recordLead.status,
  //       "status": recordLead.status,
  //       "id": recordLead.city,
  //       "state": recordLead.state
  //     });
  //   }
  // }
  // print(returnList);
  // returnList.sort((a, b) => a.city.compareTo(b.city));
  //print(returnList);
  // return returnList;

  // Same logic condensed and Sorting based on total complaint per state added
  List<dynamic> returnList = [];
  Map<String, int> stateComplaintCount =
      {}; // To store the complaint count for each state

  // First pass: Group by state and count complaints
  for (var record in listLeadMange) {
    bool stateExists = false;

    // Check if the state already exists in returnList
    for (var entry in returnList) {
      if (entry["state"] == record.state) {
        stateExists = true;
        break;
      }
    }

    // If the state doesn't exist, add it
    if (!stateExists) {
      returnList.add({
        "city": record.city,
        "stage": record.stage,
        "status": record.status,
        "id": record.id,
        "state": record.state
      });

      // Track the number of complaints for each state
      stateComplaintCount[record.state] = 0;
    }

    // Increment the complaint count for the state
    stateComplaintCount[record.state] =
        (stateComplaintCount[record.state] ?? 0) + 1;
  }

  // Sort returnList based on the complaint count in descending order
  returnList.sort((a, b) {
    final countA = stateComplaintCount[a["state"]] ?? 0;
    final countB = stateComplaintCount[b["state"]] ?? 0;
    return countB.compareTo(countA); // Descending order
  });

  return returnList;
}

List<LeadsManagementRecord> filteredComplaints(
  List<LeadsManagementRecord> leadsDoc,
  String filterExce,
  String filterNum,
  String filterField,
  bool isReassignedActive,
) {
  // Filter by reassigned flag if active
  if (isReassignedActive) {
    leadsDoc = leadsDoc
        .where((lead) => lead.isReassigned != null && lead.isReassigned == true)
        .toList();
  }

  // print(filterExce);
  if (filterExce.isNotEmpty) {
    leadsDoc = leadsDoc.where((lead) => lead.assignedTo == filterExce).toList();
    //print(leadsDoc);
  }

  if (filterField.isNotEmpty && filterNum.isNotEmpty) {
    leadsDoc = leadsDoc.where((lead) {
      switch (filterField) {
        case "Mobile":
          return lead.mobile == filterNum;
        case "Serial":
          return lead.customFields.serial.toString() == filterNum;
        case "Complaint":
          return lead.ticket == filterNum;
        default:
          return false;
      }
    }).toList();
  }

  return leadsDoc;
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

String getDayIdDate() {
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
  var invNum = day + "-" + month + "-" + date.year.toString();
  // print(invNum);
  return invNum;
}

List<LeadsRecord> groupByCitiesCopy2(List<LeadsRecord> list) {
  List<LeadsRecord> returnList = [];

  for (var record in list) {
    //print(record.city);
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
  //print(returnList);
  return returnList;
}

List<dynamic> groupBySourceReport(
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
        if (record.source == returnList[i]["source"]) {
          flag = true;
          break;
        } else {
          if (count == returnList.length && flag == false) {
            returnList.add({
              "source": record.source,
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
        "source": record.source,
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
        if (recordLead.source == returnList[i]["source"]) {
          flag = true;
          break;
        } else {
          if (count == returnList.length && flag == false) {
            // returnList.add(recordLead);
            returnList.add({
              "source": recordLead.source,
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
        "source": recordLead.source,
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

List<dynamic> groupLeadByExcecutive(List<LeadsManagementRecord> list) {
  // Custom grouping
  //Map<String, List<Map<String, dynamic>>> grouped = {};

  // Group and count occurrences dynamically
  Map<String, int> grouped1 = {};

  for (var doc in list) {
    //print(doc.assignedTo);
    final category = doc.assignedTo; // Handle missing fields
    if (!grouped1.containsKey(category)) {
      grouped1[category] = 0;
    }
    grouped1[category] = grouped1[category]! + 1;
  }

  // Convert the map into a list of JSON objects
  List<dynamic> jsonList = grouped1.entries
      .map((entry) => {"id": entry.key, "count": entry.value})
      .toList();
  //print(jsonList);
  jsonList.sort((a, b) => b["count"].compareTo(a["count"]));

  return jsonList;

  //-----------------
  //return grouped.values.expand((group) => group).toList();
}

List<dynamic> groupByCitiesReportCopy(
  List<LeadsManagementRecord> listLeadMange,
  List<OutletLeadsRecord> listLead,
) {
  List<dynamic> returnList = [];
  print("*********");
  print(listLeadMange);
  for (var record in listLeadMange) {
    print("------------------------------------------ 1");
    print(record.mobile);
    print(record.city);
    print("------------------------------------------1");
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
  print("&&&&&&&&&&&&&&&&&&&&&&&&&&");
  print(listLead);

  for (var recordLead in listLead) {
    //  print(recordLead.city);
    if (returnList.length > 0) {
      int count = 0;
      bool flag = false;
      print("------------------------------------------2");
      print(recordLead.mobile);
      print(recordLead.city);
      print("------------------------------------------2");

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
  print(returnList);
  // returnList.sort((a, b) => a.city.compareTo(b.city));
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
//  print(invNum);
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
  // print(invNum);
  return invNum;
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
//  print("timestamp");
//  print(timestamp);
  return timestamp;
}

bool activeDevice(bool? data) {
  // Add your function code here!
  if (data!) {
    // print("DeActivate");
    return false;
  } else {
    // print("Activate");
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

int? getPrevioustMonthMili(
  DateTime curDate,
  String index,
) {
  //var day;
  //if (date.day.toString().length == 1) {
  //day = "0" + date.day.toString();
  //} else {
  //  day = date.day.toString();

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

int subscriptionDays(
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

  // If the difference is negative, set it to 0
  if (difference < 0) {
    difference = 0;
  }

  // String value = difference.toString();

  // return value;
  return difference;
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
  // print(invNum);
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
  // print(tempList);
  return tempList;
}

String getToday(DateTime dateTime) {
  var day, month;
  day = dateTime.day.toString();
  month = dateTime.month.toString();

//  print(dateTime);

  var invNum = dateTime.year.toString() +
      "-" +
      (month.length < 2 ? "0" + month : month).toString() +
      "-" +
      (day.length < 2 ? "0" + day : day).toString();

//  print(invNum);
  return invNum.toString();
}

String getyesterday() {
  final DateTime now = DateTime.now();
  final DateTime yesterday = DateTime(now.year, now.month, now.day - 1);

  var day, month;
  day = yesterday.day.toString();
  month = yesterday.month.toString();
  // print(yesterday);

  var invNum = yesterday.year.toString() +
      "-" +
      (month.length < 2 ? "0" + month : month).toString() +
      "-" +
      (day.length < 2 ? "0" + day : day).toString();

  // print(invNum);
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

//  print(datetime);
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
  // req!.replaceAll("<br>", " ");

  // res = (req!.indexOf('.') == -1 ? req! : req!.substring(0, req!.indexOf('.')));

  res = req!.replaceAll(RegExp(r'[^\w\s]'), '');

  return res;

  //return res;
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

// print(docId);
//  print(outletId);
  return FirebaseFirestore.instance
      .doc('/OUTLET/' + outletId + '/LEADS_MANAGEMENT/$docId');
}

int last30days() {
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
  //print(stage);
  //print(status);
  return stage;
}

List<String> dropdownStatusList(
  String stage,
  bool isSearching,
) {
  List<String> list = [];

  if (stage.toUpperCase() == "ASSIGNED" && isSearching == false) {
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
  } else if (stage.toUpperCase() == "FOLLOWUP" && isSearching == false) {
    list.add("DEMO DONE");
    list.add("DEMO RESCHEDULED");
    list.add("FOLLOWUP");
    list.add("HOLD");
    list.add("INSTALLATION");
    list.add("COMPLETED");
    list.add("LOST");
    // print(list);
  } else if (stage.toUpperCase() == "COMPLETED" && isSearching == false) {
    list.add("COMPLETED");
    list.add("LOST");

    //  print(list);
  } else if (stage.toUpperCase() == "LOST" && isSearching == false) {
    list.add("LOST");

    //  print(list);
  } else if (isSearching == true) {
    list.add("ASSIGNED");
    list.add("RINGING");
    list.add("CALLED");
    list.add("CALL BACK");
    list.add("CALL PENDING");
    list.add("DEMO SCHEDULED");
    list.add("DEMO PENDING");
    list.add("DEMO DONE");
    list.add("COMPLETED");
    list.add("DEMO RESCHEDULED");
    list.add("FOLLOWUP");
    list.add("HOLD");
    list.add("INSTALLATION");
    list.add("LOST");
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
  // print(obj);
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
    //  print("1");
    list1 = list[i].leadTag;
    //  print(list[i].leadTag);
    for (int j = 0; j < list1.length; j++) {
      //  print("2");
      count++;
      if (type == list1[j].leadTagName) {
        //  print("3");
        returnList.add(list[i]);
        flag = true;
        //  print(list1[j].leadTagName);
        // print(list[i]);
      }
      //  print("end if");
    }
    // print("end for j");
  }
  // print("end of i");
//  print(returnList);
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
  //print(returnList);
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
  // print(jsonList);
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
    //  print(list);
    nextCode = maxCode + 1;
  } else {
    nextCode = 1;
  }
//  print(nextCode);
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

List<dynamic> orderByList(
  List<dynamic> jsonList,
  String? type,
) {
  if (type == "a") {
    jsonList.sort((a, b) => a['createdDate'].compareTo(b['createdDate']));
  } else if (type == "d") {
    jsonList.sort((a, b) => b['createdDate'].compareTo(a['createdDate']));
  }
  return jsonList;
}

List<String> statusFilters(String filter) {
  List<String> list = [];

  list.add(filter.toLowerCase());
  list.add(filter.toUpperCase());

  return list;
}

int index(int indexNo) {
  return (indexNo + 1);
}

DocumentReference getStageDocId(
  String? id,
  DocumentReference? parentRef,
) {
  var docId = parentRef!.id;
  var subId = id;
  return FirebaseFirestore.instance.doc('/OUTLET/$docId/LEAD_STAGES/$subId');
}

List<dynamic> groupLeadDocs(
  String groupField,
  List<LeadsManagementRecord> list,
) {
  // Custom grouping
  //Map<String, List<Map<String, dynamic>>> grouped = {};
  Map<String, List<LeadsManagementRecord>> grouped = {};
  List<dynamic> jsonData = [];
  for (var doc in list) {
    //final category = doc.status;
    final category = doc.stage;
    if (!grouped.containsKey(category)) {
      grouped[category] = [];
    }
    grouped[category]!.add(doc);
    jsonData
        .add({"status": grouped[category], "count": grouped[category]!.length});
  }
  //print(jsonData);
  //--------------------
  Map<String, int> countMap = {};

  // Group and count occurrences dynamically
  Map<String, int> grouped1 = {};

  for (var doc in list) {
    final category = doc.stage; // Handle missing fields
    if (!grouped1.containsKey(category)) {
      grouped1[category] = 0;
    }
    grouped1[category] = grouped1[category]! + 1;
  }

  // Convert the map into a list of JSON objects
  List<dynamic> jsonList = grouped1.entries
      .map((entry) => {"status": entry.key, "count": entry.value})
      .toList();
  //print(jsonList);

  jsonList.sort((a, b) => b["count"].compareTo(a["count"]));
  return jsonList;

  //-----------------
  //return grouped.values.expand((group) => group).toList();
}

double getTotalTaxAmount(List<PurchaseSaleItemListStruct> productListJson) {
  double totalAmount = 0.0;
  for (var product in productListJson) {
    double cgstAmt = product.sgst;
    double sgstAmt = product.cgst;
    totalAmount += cgstAmt + sgstAmt;
  }
  return totalAmount;
}

double getTotalPurchase(
  double? qty,
  double? price,
) {
  double total = qty! * price!;
  // double sub = FFAppState().subTotal;
  // FFAppState().subTotal = sub + total;
  // Add your function code here!
  return (qty * price).toDouble();
}

String? imgStrtoimagePath(String? imageLink) {
  return imageLink;
}

String getMonthFormatDayId(String format) {
  final DateTime now = DateTime.now();
  final DateTime today = DateTime(now.year, now.month, now.day);

  var day, month;
  var invNum;
  day = today.day.toString();
  month = today.month.toString();
  print(today);

  if (format == "year") {
    invNum = today.year.toString() +
        "-" +
        (month.length < 2 ? "0" + month : month).toString() +
        "-" +
        (day.length < 2 ? "0" + day : day).toString();
  } else if (format == "month") {
    invNum = (month.length < 2 ? "0" + month : month).toString() +
        "-" +
        today.year.toString();
  }

  print(invNum);
  return invNum.toString();
}

String genInvoiceNum(int? count) {
  DateTime date = DateTime.now();
  var invNum = date.day.toString() +
      date.month.toString() +
      date.year.toString() +
      count.toString();

  print(invNum);
  return invNum.toString();
}

double? roundOffSale(double? discAmount) {
  if (discAmount == null) {
    return null;
  }
  double roundedAmount = discAmount.roundToDouble();
  double difference = discAmount - roundedAmount;
  if (difference >= 0.5) {
    roundedAmount += 1;
  }
  return roundedAmount;
}

double roundOff1(double number) {
  print("Tax");
  print(number);
  double output;

  output = double.parse(number.toStringAsFixed(2));
  print("output");
  print(output);

  return output;
}

double stringToDouble(String str) {
  return double.parse(str);
}

List<SaleRecord> orderBy(
  List<SaleRecord> docs,
  String type,
) {
  if (type == "a") {
    docs.sort((a, b) => a.orderDate.compareTo(b.orderDate));
  } else if (type == "d") {
    docs.sort((a, b) => b.orderDate.compareTo(a.orderDate));
  }
  return docs;
}

String? returnStr(dynamic jsonstr) {
  return jsonstr.toString();
}

String? trimMobile(
  String mobile,
  String? index,
) {
  // Remove '+', '-' or any other non-digit characters

  String formattedNumber = mobile.replaceAll(RegExp(r'\D'), '');
// Add '91' prefix if not already present
  if (!formattedNumber.startsWith('91')) {
    formattedNumber = '91' + formattedNumber;
  }
  print(formattedNumber);
  return formattedNumber;
}

int incrementSourceCount(
  String source,
  String stage,
) {
  //Normalize source and stage

  Map<String, Map<String, int>> sourceStageCounts = {
    "INDIAMART": {"followup": 0, "completed": 0, "lost": 0},
    "JUSTDAIL": {"followup": 0, "completed": 0, "lost": 0},
    "FACEBOOK": {"followup": 0, "completed": 0, "lost": 0},
    "QUICKLEAD": {"followup": 0, "completed": 0, "lost": 0},
  };
  LeadCountStruct list;
  String normalizedSource = source.toUpperCase();
  String normalizedStage = stage.toLowerCase();

  // Check if source exists in the map
  if (sourceStageCounts.containsKey(normalizedSource)) {
    // Check if stage exists for the source
    if (sourceStageCounts[normalizedSource]!.containsKey(normalizedStage)) {
      // Increment the count
      sourceStageCounts[normalizedSource]![normalizedStage] =
          sourceStageCounts[normalizedSource]![normalizedStage]! + 1;
    } else {
      // If stage doesn't exist, initialize it
      sourceStageCounts[normalizedSource]![normalizedStage] = 1;
    }
  } else {
    // If source doesn't exist, initialize it with the current stage
    sourceStageCounts[normalizedSource] = {normalizedStage: 1};
  }
  print(sourceStageCounts);
  return 1;
}

String genComplaintNum(
  int count,
  String zone,
) {
  String zoneTemp = zone == "SOUTH"
      ? "N"
      : zone == "NORTH"
          ? "N"
          : "W"; // Example zone
  // Example count
  String countTemp = count < 1 ? "1" : (count + 1).toString();
  if (countTemp.length < 2) {
    countTemp = "0" + countTemp;
  }
  DateTime date = DateTime.now();
  String formattedDate = DateFormat('yyMMdd').format(date);
  // String complaintNum = "DY" + zoneTemp + formattedDate + countTemp;
  String complaintNum = formattedDate + countTemp;

  // print(complaintNum);
  return complaintNum.toString();
}

String? selectedDayId(DateTime dateTime) {
  var day;

  if (dateTime.day.toString().length == 1) {
    day = "0" + dateTime.day.toString();
  } else {
    day = dateTime.day.toString();
  }
  var month;
  if (dateTime.month.toString().length == 1) {
    month = "0" + dateTime.month.toString();
  } else {
    month = dateTime.month.toString();
  }

  //var invNum = dateTime.year.toString() + "-" + month + "-" + day;
  var invNum = day + "-" + month + "-" + dateTime.year.toString();

  print(invNum);
  return invNum.toString();
}

List<dynamic> updateAllLeads(
  int index,
  String stage,
  List<dynamic> jsonList,
) {
  List<dynamic> list = jsonList;
  list[index]["stage"] = stage;
  list[index]["status"] = stage;

  return list;
}

List<OutletLeadsRecord> filteredNewComplaints(
  List<OutletLeadsRecord> leadsDoc,
  String filterNum,
  String filterField,
) {
  List<OutletLeadsRecord> returnLeadsDoc = leadsDoc;
  List<OutletLeadsRecord> returnLeadsDoc1 = [];

  if (filterField != null) {
    for (int j = 0; j < returnLeadsDoc.length; j++) {
      if (filterField == "Mobile") {
        if (leadsDoc[j].mobile == filterNum) {
          returnLeadsDoc1.add(leadsDoc[j]);
        }
      } else if (filterField == "Serial") {
        if (leadsDoc[j].customFields.serial.toString() == filterNum) {
          returnLeadsDoc1.add(leadsDoc[j]);
        }
      } else if (filterField == "Complaint") {
        if (leadsDoc[j].ticket == filterNum) {
          returnLeadsDoc1.add(leadsDoc[j]);
        }
      }
    }
  } else {
    returnLeadsDoc1 = returnLeadsDoc;
  }

  return returnLeadsDoc1;
}

bool getStagePermission(
  String id,
  List<StageAccessDataTypeStruct> stageAccessList,
) {
  print("--------------------");
  print(stageAccessList.any((stage) => stage.id == id && stage.value == 4));
  print("--------------------");
  return stageAccessList.any((stage) => stage.id == id && stage.value == 4);
}

List<LeadStagesRecord>? filterLeadStageByAccess(
  List<LeadStagesRecord>? leadStageList,
  List<StageAccessDataTypeStruct>? stageAccessList,
) {
  if (leadStageList == null || stageAccessList == null) return [];

  return stageAccessList
      .where((access) => access.value == 4) // Filter only value == 4
      .where((access) =>
          leadStageList.any((lead) => lead.id == access.id)) // Match ID
      .map((access) {
    final matchedLead =
        leadStageList.firstWhere((lead) => lead.id == access.id);
    return matchedLead!;
  }).toList();
}

CustFeedbackStruct storeFeedbackList(
  String que,
  String ans,
) {
  List<CustFeedbackStruct> returnList = [];
  CustFeedbackStruct struct = CustFeedbackStruct();

  int tempRating = 0;
  switch (ans) {
    case "Excellent":
      tempRating = 5;

      break;

    case "Good":
      tempRating = 4;

      break;

    case "Neutral":
      tempRating = 3;

      break;

    case "Poor":
      tempRating = 2;

      break;

    case "Very Poor":
      tempRating = 1;

      break;

    default:
      tempRating;

      break;
  }

  struct =
      createCustFeedbackStruct(question: que, answer: ans, rating: tempRating);

  returnList.add(struct);

  print(returnList);

  return returnList[0];
}

List<dynamic> feedbackChartCount(List<CustomerFeedbackRecord> feedbackDocs) {
  int supportCount = 0;
  int quicklyCount = 0;
  int expectationsCount = 0;
  int overallCount = 0;

  double totalRatingSum = 0.0;
  int totalRatingCount = 0;

  List<CustFeedbackStruct> custFeeds = [];

  for (int i = 0; i < feedbackDocs.length; i++) {
    custFeeds.addAll(feedbackDocs[i].custFeedback);
  }

  for (int j = 0; j < custFeeds.length; j++) {
    String question = custFeeds[j].question.toLowerCase();
    double rating = custFeeds[j].rating.toDouble();

    if (question.contains("support")) {
      supportCount++;
      totalRatingSum += rating;
      totalRatingCount++;
    } else if (question.contains("quickly")) {
      quicklyCount++;
      totalRatingSum += rating;
      totalRatingCount++;
    } else if (question.contains("expectations")) {
      expectationsCount++;
      totalRatingSum += rating;
      totalRatingCount++;
    } else if (question.contains("overall")) {
      overallCount++;
      totalRatingSum += rating;
      totalRatingCount++;
    }
  }

  double avgRating =
      totalRatingCount > 0 ? (totalRatingSum / totalRatingCount) : 0.0;

  return [
    {"index": "Support", "count": supportCount},
    {"index": "Promptness", "count": quicklyCount},
    {"index": "Expectations", "count": expectationsCount},
    {"index": "Overall", "count": overallCount},
  ];
}

double calculateAvgRating(List<CustomerFeedbackRecord> docs) {
  double avgRating;
  int supportCount = 0;
  int quicklyCount = 0;
  int expectationsCount = 0;
  int overallCount = 0;

  double totalRatingSum = 0.0;
  int totalRatingCount = 0;

  List<CustFeedbackStruct> custFeeds = [];

  for (int i = 0; i < docs.length; i++) {
    custFeeds.addAll(docs[i].custFeedback);
  }

  for (int j = 0; j < custFeeds.length; j++) {
    String question = custFeeds[j].question.toLowerCase();
    double rating = custFeeds[j].rating.toDouble();

    if (question.contains("support")) {
      supportCount++;
      totalRatingSum += rating;
      totalRatingCount++;
    } else if (question.contains("quickly")) {
      quicklyCount++;
      totalRatingSum += rating;
      totalRatingCount++;
    } else if (question.contains("expectations")) {
      expectationsCount++;
      totalRatingSum += rating;
      totalRatingCount++;
    } else if (question.contains("overall")) {
      overallCount++;
      totalRatingSum += rating;
      totalRatingCount++;
    }
  }

  avgRating = totalRatingCount > 0 ? (totalRatingSum / totalRatingCount) : 0.0;

  return avgRating;
}

List<UserAccesCStruct> setPermission(
  List<String> list,
  int leads,
  int webDashboard,
  bool isCRM,
) {
  List<dynamic> accessString = [];
  accessString.add({"title": "Edit Bill", "value": 0});
  accessString.add({"title": "Goods Received", "value": 0});
  accessString.add({"title": "Reports", "value": 0});
  accessString.add({"title": "Settings", "value": 0});
  accessString.add({"title": "Shift Report", "value": 0});
  accessString.add({"title": "Stock Out", "value": 0});
  accessString.add({"title": "Payment", "value": 0});
  accessString.add({"title": "Barcode", "value": 0});
  accessString.add({"title": "Sales Order", "value": 0});
  accessString.add({"title": "Purchase Order", "value": 0});
  accessString.add({"title": "Leads", "value": leads});
  accessString.add({"title": "Service Call", "value": 0});
  accessString.add({"title": "Expense", "value": 0});
  accessString.add({"title": "Production Batch", "value": 0});
  accessString.add({"title": "Attendance", "value": 0});
  accessString.add({"title": "CareProfile", "value": 0});
  accessString.add({"title": "WebDashboard", "value": webDashboard});

  print(accessString);

  List<UserAccesCStruct> returnList = [];
  UserAccesCStruct struct = UserAccesCStruct();

  for (int j = 0; j < accessString.length; j++) {
    struct = createUserAccesCStruct(
        title: accessString[j]["title"], value: accessString[j]["value"]);
    returnList.add(struct);
  }

  print(returnList);

  return returnList;
}

String generateDealerCode(String input) {
  List<String> words = input.split(' ');

  // Get the first three characters of the first two words and convert to uppercase
  String firstWordCode;
  firstWordCode =
      words[0].substring(0, words[0].length < 3 ? words[0].length : 3);
  String secondWordCode =
      words[1].substring(0, words[1].length < 3 ? words[1].length : 3);
  print(firstWordCode);
  print(secondWordCode);
  if (firstWordCode.length == 1) {
    secondWordCode =
        words[1].substring(0, words[1].length < 5 ? words[1].length : 5);
  } else if (firstWordCode.length == 2) {
    secondWordCode =
        words[1].substring(0, words[1].length < 4 ? words[1].length : 4);
  } else if (firstWordCode.isEmpty) {
    secondWordCode =
        words[1].substring(0, words[1].length < 6 ? words[1].length : 6);
  }

  if (secondWordCode.length == 1) {
    firstWordCode =
        words[0].substring(0, words[0].length < 5 ? words[0].length : 5);
  } else if (secondWordCode.length == 2) {
    firstWordCode =
        words[0].substring(0, words[0].length < 4 ? words[0].length : 4);
  } else if (secondWordCode.isEmpty) {
    firstWordCode =
        words[0].substring(0, words[0].length < 6 ? words[0].length : 6);
  }
  // Concatenate the codes from the two words

  String code = firstWordCode + secondWordCode;
  print(code);
  if (code.length < 6) {
    int additionalCharsNeeded = 6 - code.length;
    for (int i = 0; i < additionalCharsNeeded; i++) {
      code = code + "*";
    }
    print(code);
  }
  print(code);
  return code.toUpperCase();
}

int getTodayDateInMili(DateTime customDate) {
// get customDate value in integer   12/02/2025 00: 00 :00

  var today = DateTime(customDate.year, customDate.month, customDate.day);
  return today.millisecondsSinceEpoch;
}

List<AttendanceRecord> getZonewiseAtt(
  List<AttendanceRecord> attendanceDocs,
  List<TeamTreeRecord> team,
) {
  List<AttendanceRecord> attendanceList = [];
  final teamUserIds = team.map((t) => t.userProfileId).toSet();

  if (attendanceDocs != null) {
    for (final att in attendanceDocs) {
      if (teamUserIds.contains(att.userId)) {
        attendanceList.add(att);
      }
    }
  }

  return attendanceList;
}

String attendanceTime(int? dateInNumber) {
  // Millisecond to hh:mm AM/PM format
  String res;
  if (dateInNumber == 0 || dateInNumber == null) {
    res = "0:00 AM";
  } else {
    var a = DateTime.fromMillisecondsSinceEpoch(dateInNumber!);
    int hour = a.hour;
    int minute = a.minute;

    // Convert to 12-hour format
    String period = hour < 12 ? 'AM' : 'PM';
    hour = hour == 12 ? 12 : hour % 12;

    res = "$hour:$minute $period";
  }
  print(res);
  return res;
}

List<TeamTreeRecord> returnAbsentUserList(
  List<TeamTreeRecord> teamTree,
  List<AttendanceRecord> attendance,
) {
  List<TeamTreeRecord> absentUsers = [];

  for (var member in teamTree) {
    final isPresent = attendance.any(
      (att) => att.userId == member.userProfileId,
    );

    if (!isPresent) {
      absentUsers.add(member);
    }
  }

  return absentUsers;
}

int getZonewise(
  List<LeaveApplicationRecord> leaveApplications,
  List<AttendanceRecord> attendanceDocs,
  String index,
  List<TeamTreeRecord> team,
) {
  int count = 0;
  final teamUserIds = team.map((t) => t.userProfileId).toSet();
  if (index == "Leave") {
    for (final leave in leaveApplications) {
      if (teamUserIds.contains(leave.userProfileId)) {
        count++;
      }
    }
  } else if (index == "Attendance") {
    if (attendanceDocs != null) {
      for (final att in attendanceDocs) {
        if (teamUserIds.contains(att.userId)) {
          count++;
        }
      }
    }
  } else {
    count = 0;
  }

  return count;
}

String checkAbsentCount(
  List<TeamTreeRecord> team,
  List<AttendanceRecord> attendance,
  List<LeaveApplicationRecord> leave,
) {
  int absentCount = 0;

  print("team");
  print(team);
  print("attendance");
  print(attendance);
  print("leave");
  print(leave);

  for (var member in team) {
    final isOnLeave = leave.any(
      (lv) => lv.userProfileId == member.userProfileId,
    );
    if (!isOnLeave) {
      final isPresent = attendance.any(
        (att) => att.userId == member.userProfileId,
      );
      if (!isPresent && !isOnLeave) {
        absentCount++;
      }
    }

    // Count as absent only if not present and not on leave
  }

  return absentCount.toString();
}

DateTime? geStartEndDateTimeFromMilisec(
  int start,
  int end,
  String index,
) {
  DateTime result;

  /// Returns a Map with normalized 'start' and 'end' timestamps (milliseconds).

  // Convert to DateTime
  final startDate = DateTime.fromMillisecondsSinceEpoch(start);
  final endDate = DateTime.fromMillisecondsSinceEpoch(end);

  // Normalize start to 00:00:00.000
  final startOfDay = DateTime(startDate.year, startDate.month, startDate.day);

  // Normalize end to 23:59:59.999
  final endOfDay =
      DateTime(endDate.year, endDate.month, endDate.day, 23, 59, 59, 999);
  if (index == "start") {
    result = startOfDay;
  } else {
    result = endOfDay;
  }

  return result;
}

String getAssingedToByState(
  List<TeamTreeRecord> teamTree,
  String state,
  String index,
) {
  String res = "";

  String? targetName;
  if (index == "CRM") {
    if (state == "KERALA") {
      targetName = "ELSON ELDHO";
    } else if (state == "ANDRA PRADESH" ||
        state == "KARNATAKA" ||
        state == "") {
      targetName = "TIRUPARI VAASU";
    } else if (state == "TAMILNADU") {
      targetName = "HARIHARA VISHNU ";
    }
  } else {
    if (state == "KERALA") {
      targetName = "Test Manager1";
    } else if (state == "ANDRA PRADESH" || state == "KARNATAKA") {
      targetName = "Test Manager1";
    }
  }

  if (targetName != null) {
    final match = teamTree.firstWhere(
      (t) => t.userName.toLowerCase() == targetName!.toLowerCase(),
    );
    res = match.userProfileId ?? "";
  }

  return res;
}

String genComplaintTicket(List<OutletLeadsRecord> leadsDoc) {
  DateTime date = DateTime.now();
  String formattedDate = DateFormat('yyMMdd').format(date);

  int nextCount = 1;

  if (leadsDoc.isNotEmpty) {
    // Find the ticket with the max value
    leadsDoc.sort((a, b) => a.ticket.compareTo(b.ticket));
    String lastTicket = leadsDoc.last.ticket;

    // Extract numeric part after yyMMdd
    String lastCountStr = lastTicket.substring(6);
    int lastCount = int.tryParse(lastCountStr) ?? 0;
    nextCount = lastCount + 1;
  }

  // Always pad with 2 digits (01, 02, …)
  String countTemp = nextCount.toString().padLeft(2, '0');

  return formattedDate + countTemp;
}

DateTime getExpiryDateTime(
  DateTime curTime,
  int? delayInSeconds,
) {
  final delay = Duration(seconds: delayInSeconds ?? 0);
  return curTime.add(delay);
}

List<CallLogSummeryStruct> callSummeryDash(List<CallLogsRecord> callLogDocs) {
// Department order list (modify this to change output order)
  final List<String> departmentOrder = [
    'Total',
    'Sales',
    'HR',
    'Software Support',
    'Hardware Support',
    'Software',
    'Account'
  ];

  // A map to group call summaries by department
  final Map<String, CallLogSummeryStruct> depMap = {};

  // Initialize total summary
  final totalSummary = CallLogSummeryStruct(
    depname: 'Total',
    total: 0,
    incoming: 0,
    outgoing: 0,
    rejected: 0,
    missed: 0,
    names: [], // You can choose to aggregate employee stats or not
  );

  for (final depName in departmentOrder) {
    if (depName != 'Total') {
      depMap[depName] = CallLogSummeryStruct(
        depname: depName,
        total: 0,
        incoming: 0,
        outgoing: 0,
        rejected: 0,
        missed: 0,
        names: [],
      );
    }
  }

  for (final log in callLogDocs) {
    final depName = log.department;
    final direction = log.direction ?? '';
    final number = log.receiverMobileNo;
    final receiverName = log.receiverName;

    print('$depName + $direction + $number');

    // Get or create a department summary
    var summary = depMap[depName];
    if (summary == null) {
      summary = CallLogSummeryStruct(
        depname: depName,
        total: 0,
        incoming: 0,
        outgoing: 0,
        rejected: 0,
        missed: 0,
        names: [], // Initialize the list of employee call logs
      );
    }

    // Increment total calls for the department
    summary.total += 1;
    totalSummary.total += 1;

    // Get or create a call log entry for the receiver
    var employeeCallLog = summary.names.firstWhere(
      (log) => log.name == receiverName,
      orElse: () {
        final newLog = createCallLogNameStruct(
          name: receiverName,
        );
        // Initialize stats manually since constructor doesn't accept it
        newLog.stats = [
          0,
          0,
          0,
          0,
          0
        ]; // [incoming, outgoing, rejected, missed, total]
        return newLog;
      },
    );

    // Define the stats index mapping (order: incoming, outgoing, rejected, missed)
    if (direction == CallLogStatus.incoming) {
      summary.incoming =
          summary.incoming + 1; // Total Incoming for the department
      totalSummary.incoming = totalSummary.incoming + 1;
      employeeCallLog.stats[0] =
          employeeCallLog.stats[0] + 1; // Incoming for the employee
    } else if (direction == CallLogStatus.outgoing) {
      summary.outgoing =
          summary.outgoing + 1; // Total Outgoing for the department
      totalSummary.outgoing = totalSummary.outgoing + 1;
      employeeCallLog.stats[1] =
          employeeCallLog.stats[1] + 1; // Outgoing for the employee
    } else if (direction == CallLogStatus.rejected) {
      summary.rejected =
          summary.rejected + 1; // Total Rejected for the department
      totalSummary.rejected = totalSummary.rejected + 1;
      employeeCallLog.stats[2] =
          employeeCallLog.stats[2] + 1; // Rejected for the employee
    } else if (direction == CallLogStatus.missed) {
      summary.missed = summary.missed + 1; // Total Missed for the department
      totalSummary.missed = totalSummary.missed + 1;
      employeeCallLog.stats[3] =
          employeeCallLog.stats[3] + 1; // Missed for the employee
    }

    // Increment total calls for the employee
    employeeCallLog.stats[4] += 1;

    // Add this employee's call log entry to the department's summary
    if (!summary.names.contains(employeeCallLog)) {
      summary.names.add(employeeCallLog);
    }

    // Save the updated summary back to the map
    depMap[depName] = summary;
  }

  // Add the total summary to the map
  depMap['Total'] = totalSummary;

  // Create ordered list based on departmentOrder
  final List<CallLogSummeryStruct> orderedList = [];
  for (final depName in departmentOrder) {
    if (depMap.containsKey(depName)) {
      orderedList.add(depMap[depName]!);
    }
  }

  // Add any departments not in the hardcoded order to the end
  for (final entry in depMap.entries) {
    if (!departmentOrder.contains(entry.key)) {
      orderedList.add(entry.value);
    }
  }

  // Return the list of summaries
  return orderedList;
}

String formatCallDurationToHHMMSS(int totalSeconds) {
  final hours = (totalSeconds ~/ 3600).toString().padLeft(2, '0');
  final minutes = ((totalSeconds % 3600) ~/ 60).toString().padLeft(2, '0');
  final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
  return '$hours:$minutes:$seconds';
}

List<LeadsManagementRecord> filteredEmployeesForReports(
  List<LeadsManagementRecord> leadsDoc,
  String? review,
  String? solution,
) {
  if (review!.isNotEmpty) {
    leadsDoc = leadsDoc.where((lead) => lead.remarks == review).toList();
    //print(leadsDoc);
  }

  if (solution!.isNotEmpty) {
    leadsDoc = leadsDoc.where((lead) {
      final customFields = lead.customFields;
      return customFields.hasSolution() && customFields.solution == solution;
    }).toList();
  }

  return leadsDoc;
}

List<String> leadMobileNumberParser(String? phone) {
  if (phone == null || phone.trim().isEmpty) {
    return ['+91', ''];
  }

  // Remove all non-digit characters
  final digitsOnly = phone.replaceAll(RegExp(r'\D'), '');

  // Take last 10 digits if available
  final lastTen = digitsOnly.length > 10
      ? digitsOnly.substring(digitsOnly.length - 10)
      : digitsOnly;

  // Return list: one with +91 prefix, one without
  return ['+91$lastTen', lastTen];
}

List<TeamTreeRecord> getComplaintSortedArray(
  List<LeadsManagementRecord> leadDocs,
  List<TeamTreeRecord> userDocs,
) {
  // Sort the userDocs list based on the number of complaints assigned to each user
  userDocs.sort((userDocA, userDocB) {
    // Get the user's profile ID from the team record
    final userIdA = userDocA.userProfileId;
    final userIdB = userDocB.userProfileId;

    // Count how many complaints are assigned to each user
    final countA = leadDocs.where((lead) => lead.assignedTo == userIdA).length;
    final countB = leadDocs.where((lead) => lead.assignedTo == userIdB).length;

    // Sort in descending order (highest number of complaints first)
    return countB.compareTo(countA);
  });

  return userDocs;
}

double subscriptionDaysProgress(
  int activationDate,
  int expiryDate,
) {
  // Get the current time in milliseconds
  final int currDate = DateTime.now().millisecondsSinceEpoch;

  // Prevent division by zero
  if (expiryDate == activationDate) {
    return 0.0;
  }

  // Calculate normalized progress
  double progress = (expiryDate - currDate) / (expiryDate - activationDate);

  // Clamp progress between 0 and 1
  if (progress < 0) progress = 0;
  if (progress > 1) progress = 1;

  return progress;
}

/// Calculates the Time it took to resolve a Complaint should only run when
/// Complaint is in Completed Stage else closedDateMilli is always 0
String calculateComplaintResolutionDuration(
  int createdDateMilli,
  int closedDateMilli,
) {
  // If ticket or item is still open
  if (closedDateMilli == 0) {
    return 'Active';
  }

  int diffMillis = closedDateMilli - createdDateMilli;
  int totalSeconds = diffMillis ~/ 1000;

  if (totalSeconds < 60) {
    return '${totalSeconds}s';
  }

  int days = totalSeconds ~/ (24 * 3600);
  int hours = (totalSeconds % (24 * 3600)) ~/ 3600;
  int minutes = (totalSeconds % 3600) ~/ 60;

  List<String> parts = [];

  if (days > 0) parts.add('${days}d');
  if (hours > 0) parts.add('${hours}h');
  parts.add('${minutes}m'); // always include minutes

  return parts.join(' ');
}
