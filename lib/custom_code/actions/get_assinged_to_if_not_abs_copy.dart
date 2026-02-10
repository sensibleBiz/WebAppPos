// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<dynamic> getAssingedToIfNotAbsCopy(
  List<TeamTreeRecord> teamTree,
  String index,
  List<LeaveApplicationRecord> leaveDocs,
  String state,
  List<LeadsManagementRecord> leadDocs,
) async {
  // Add your function code here!
  final snapshot = await FFAppState()
      .deyeOutletId!
      .collection('AUTO_ASSIGN')
      .where('isActive', isEqualTo: true)
      .limit(1)
      .get();

  final userIds = snapshot.docs.first.data();

  // UPDATED
  // Declare the IDs manually (you will fill these values)
  // String elsonId = 'Zidktay5v9R2lrjMeHgF3gHfm6g1';
  // String ananduId = '6umnbcLyCvfr2XNPJDLvStQp82Z2';
  // String bhuvanId = 'O677R5NSRsNEFtmOwNWuTECHbBy1';
  // String testUserId = 'sjzNMQQPVszp31iocnmN';
  String elsonId = userIds['user1Id'];
  String elsonName = userIds['user1Name'];
  String ananduId = userIds['user2Id'];
  String ananduName = userIds['user2Name'];
  String bhuvanId = userIds['managerId'];
  String bhuvanName = userIds['managerName'];
  String testUserId = userIds['testUserId'];
  String testUserName = userIds['testUserName'];
  String testManagerName = userIds['testManagerName'];

  String targetName = "";
  print(state);

  if (index == "CRM") {
    if (state == "KERALA") {
      // CHECK BELOW BEFORE CHANGING ORDER OF ASSIGNMENT
      targetName = elsonName;
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
      targetName = testUserName;
    } else if (state == "ANDRA PRADESH" || state == "KARNATAKA") {
      // CHECK BELOW BEFORE CHANGING ORDER OF ASSIGNMENT
      targetName = testUserName;
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
    return {"flag": true, "userProfileId": "0"};
  }

  final employeeId = match.first.userProfileId!;
  print(employeeId);

  // UPDATED
  // ✅ Count workloads based on latest assignedToHistory
  int elsonCount = 0;
  int ananduCount = 0;
  int bhuvanCount = 0;
  int testUserCount = 0;

  // UPDATED
  for (final doc in leadDocs) {
    if (doc.assignedToHistory.isNotEmpty) {
      final lastEntry = doc.assignedToHistory.last;
      final source = doc.source;
      final stage = doc.stage;
      final assignedId = lastEntry.userProfileId ?? '';

      if (assignedId == elsonId && source == 'QR' && stage == 'assigned')
        elsonCount++;
      else if (assignedId == ananduId && source == 'QR' && stage == 'assigned')
        ananduCount++;
      else if (assignedId == bhuvanId && source == 'QR' && stage == 'assigned')
        bhuvanCount++;
      else if (assignedId == testUserId &&
          source == 'QR' &&
          stage == 'assigned') testUserCount++;
    }
  }

  print('Test User Count $testUserCount');

  // UPDATED
  print(
      'Current workload -> $elsonName: $elsonCount | $ananduName: $ananduCount | $bhuvanName: $bhuvanCount');

  // ✅ If no leave records, assign employee directly
  if (leaveDocs.isEmpty) {
    // UPDATED
    if ((index == "CRM" && elsonCount < 4) ||
        (index == "demo" && testUserCount < 4)) {
      print("leaveEmpty");
      return {"flag": false, "userProfileId": employeeId};
    }
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
    // UPDATED
    if (isOnLeave || elsonCount >= 4) {
      // ✅ Special case: if Elson is on leave, fallback to Anandu first
      if (targetName.toLowerCase() == elsonName.toLowerCase()) {
        final anandu = teamTree.where(
          (t) => (t.userName ?? "").toLowerCase() == ananduName.toLowerCase(),
        );

        if (anandu.isNotEmpty &&
            anandu.first.userProfileId != null &&
            anandu.first.userProfileId!.isNotEmpty) {
          final ananduId = anandu.first.userProfileId!;
          bool isAnanduOnLeave = checkOnLeave(ananduId);

          // UPDATED
          if (!isAnanduOnLeave && ananduCount < 4) {
            return {"flag": false, "userProfileId": ananduId};
          }
        }
      }

      // 🔄 Otherwise fallback to Bhuvan
      final manager = teamTree.where(
        (t) => (t.userName ?? "").toLowerCase() == bhuvanName.toLowerCase(),
      );

      if (manager.isEmpty ||
          manager.first.userProfileId == null ||
          manager.first.userProfileId!.isEmpty) {
        return {"flag": true, "userProfileId": "0"};
      }

      final managerId = manager.first.userProfileId!;
      bool isManagerOnLeave = checkOnLeave(managerId);

      // UPDATED
      if (isManagerOnLeave || ananduCount >= 4) {
        return {"flag": true, "userProfileId": "0"};
      } else {
        return {"flag": false, "userProfileId": managerId};
      }
    } else {
      return {"flag": false, "userProfileId": employeeId};
    }
  } else {
    // UPDATED
    if (isOnLeave || testUserCount >= 4) {
      // Find manager Test Manager1 safely
      final manager = teamTree.where(
        (t) =>
            (t.userName ?? "").toLowerCase() == testManagerName.toLowerCase(),
      );

      if (manager.isEmpty ||
          manager.first.userProfileId == null ||
          manager.first.userProfileId!.isEmpty) {
        return {"flag": true, "userProfileId": "0"};
      }

      final managerId = manager.first.userProfileId!;
      bool isManagerOnLeave = checkOnLeave(managerId);

      // UPDATED
      if (isManagerOnLeave || testUserCount >= 4) {
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
