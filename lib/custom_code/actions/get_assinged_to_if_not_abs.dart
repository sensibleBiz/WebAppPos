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

import 'index.dart'; // Imports other custom actions

Future<dynamic> getAssingedToIfNotAbs(
  List<TeamTreeRecord> teamTree,
  String index,
  List<LeaveApplicationRecord> leaveDocs,
  String state,
) async {
  String targetName = "";
  print(state);

  if (index == "CRM") {
    if (state == "KERALA") {
      targetName = "ELSON ELDHO";
    } else if (state == "ANDRA PRADESH" ||
        state == "KARNATAKA" ||
        state == "TELANGANA") {
      targetName = "TIRUPARI VAASU";
    } else if (state == "TAMILNADU") {
      targetName = "HARIHARA VISHNU";
    }
  } else if (index == "demo") {
    if (state == "KERALA") {
      print(state);
      targetName = "Test User 1";
    } else if (state == "ANDRA PRADESH" || state == "KARNATAKA") {
      targetName = "Test User 1";
    }
  }

  if (targetName == "") {
    return {"flag": true, "userProfileId": "0"};
  }

  // Find employee safely
  final match = teamTree.where(
    (t) => (t.userName ?? "").toLowerCase() == targetName.toLowerCase(),
  );

  if (match.isEmpty ||
      match.first.userProfileId == null ||
      match.first.userProfileId!.isEmpty) {
    print(match.first.userProfileId);
    return {"flag": true, "userProfileId": "0"};
  }

  final employeeId = match.first.userProfileId!;
  print(employeeId);

  // ✅ If no leave records, assign employee directly
  if (leaveDocs.isEmpty) {
    print("leaveEmpty");
    return {"flag": false, "userProfileId": employeeId};
  }

  // Leave check helper
  bool checkOnLeave(String userId) {
    DateTime today = DateTime.now();
    DateTime todayStart = DateTime(today.year, today.month, today.day);
    DateTime todayEnd =
        DateTime(today.year, today.month, today.day, 23, 59, 59, 999);

    return leaveDocs.any((leave) {
      if (leave.userProfileId == userId) {
        final fromDateMs = leave.fromDate;
        final toDateMs = leave.toDate;

        if (fromDateMs != null && toDateMs != null) {
          final fromDate = DateTime.fromMillisecondsSinceEpoch(fromDateMs);
          final toDate = DateTime.fromMillisecondsSinceEpoch(toDateMs);

          return todayStart
                  .isAfter(fromDate.subtract(const Duration(days: 1))) &&
              todayEnd.isBefore(toDate.add(const Duration(days: 1)));
        }
      }
      return false;
    });
  }

  // Check if employee is on leave
  bool isOnLeave = checkOnLeave(employeeId);
  print(isOnLeave);

  if (index == "CRM") {
    if (isOnLeave) {
      // Find manager Bhuvan safely
      final manager = teamTree.where(
        (t) => (t.userName ?? "").toLowerCase() == "bhuvan",
      );

      if (manager.isEmpty ||
          manager.first.userProfileId == null ||
          manager.first.userProfileId!.isEmpty) {
        return {"flag": true, "userProfileId": "0"};
      }

      final managerId = manager.first.userProfileId!;
      bool isManagerOnLeave = checkOnLeave(managerId);

      if (isManagerOnLeave) {
        return {"flag": true, "userProfileId": "0"};
      } else {
        return {"flag": false, "userProfileId": managerId};
      }
    } else {
      return {"flag": false, "userProfileId": employeeId};
    }
  } else {
    if (isOnLeave) {
      // Find manager Test Manager1 safely
      final manager = teamTree.where(
        (t) => (t.userName ?? "").toLowerCase() == "test manager1",
      );

      if (manager.isEmpty ||
          manager.first.userProfileId == null ||
          manager.first.userProfileId!.isEmpty) {
        return {"flag": true, "userProfileId": "0"};
      }

      final managerId = manager.first.userProfileId!;
      bool isManagerOnLeave = checkOnLeave(managerId);

      if (isManagerOnLeave) {
        print("true");
        return {"flag": true, "userProfileId": "0"};
      } else {
        print("false");
        return {"flag": false, "userProfileId": managerId};
      }
    } else {
      print("false");
      return {"flag": false, "userProfileId": employeeId};
    }
  }
}
