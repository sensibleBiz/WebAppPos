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

import 'dart:convert';

import 'package:excel/excel.dart';

Future<String> genExcelForEmployeeAttendanceReport(
  List<AttendanceRecord> doc,
  String userId, // 👈 selected employee id
  String? outletId,
) async {
  var excel = Excel.createExcel();
  var sheet = excel['Attendance'];

  // Filter records for the selected employee
  List<AttendanceRecord> records =
      doc.where((r) => r.userId == userId).toList();
  if (records.isEmpty) {
    throw Exception("No attendance found for this employee");
  }
  records.sort((a, b) => a.createdDate!.compareTo(b.createdDate!));

  // Get Month/Year
  DateTime firstDate = DateTime.fromMillisecondsSinceEpoch(
      records[0].createdDate!.millisecondsSinceEpoch);
  String monthYear = DateFormat('MMM-yyyy').format(firstDate);

  // ===== Fetch employee info from USER_PROFILE =====
  DocumentSnapshot empDoc = await FirebaseFirestore.instance
      .collection('USER_PROFILE')
      .doc(userId)
      .get();

  String empName = empDoc["name"] ?? "";
  String location = empDoc["location"] ?? "";
  String state = empDoc["state"] ?? "";

  // ===== Fetch Manager Name from TEAM_TREE =====
  QuerySnapshot teamQuery = await FirebaseFirestore.instance
      .collection('OUTLET')
      .doc(outletId)
      .collection('TEAM_TREE')
      .where('managerId', isEqualTo: userId)
      .limit(1)
      .get();

  String managerName = "";
  if (teamQuery.docs.isNotEmpty) {
    var teamData = teamQuery.docs.first.data() as Map<String, dynamic>;
    managerName = teamData["managerName"] ?? "";
  }

  // ===== Header Info =====
  sheet.appendRow([TextCellValue("Month :"), TextCellValue(monthYear)]);
  sheet.appendRow([TextCellValue("Employee Name :"), TextCellValue(empName)]);
  sheet.appendRow([
    TextCellValue("Company Name :"),
    TextCellValue("DEYE Inverter Technology Pvt Ltd")
  ]);
  sheet.appendRow([TextCellValue("Location Name :"), TextCellValue(location)]);
  sheet.appendRow([TextCellValue("State Name :"), TextCellValue(state)]);
  sheet
      .appendRow([TextCellValue("Manager Name :"), TextCellValue(managerName)]);
  sheet.appendRow([]); // empty line

  // ===== Table Header =====
  sheet.appendRow([
    TextCellValue("CheckIn Location"),
    TextCellValue("CheckOut Location"),
    TextCellValue("DAY"),
    TextCellValue("DATE"),
    TextCellValue("In Time"),
    TextCellValue("Out Time"),
  ]);

  // Totals
  int presentDays = 0;
  Duration totalDuration = Duration.zero;

  // ===== Attendance Records =====
  for (var record in records) {
    DateTime checkIn = DateTime.fromMillisecondsSinceEpoch(record.checkInTime);
    DateTime checkOut = record.checkOutTime == 0
        ? checkIn.add(Duration(hours: 9)) // fallback 9hrs
        : DateTime.fromMillisecondsSinceEpoch(record.checkOutTime);

    Duration duration = checkOut.difference(checkIn);
    presentDays++;
    totalDuration += duration;

    sheet.appendRow([
      TextCellValue(record.checkInLocation ?? ""), // 👈 checkin location
      TextCellValue(record.checkOutLocation ?? ""), // 👈 checkout location
      TextCellValue(DateFormat('EEE').format(checkIn)), // Day
      TextCellValue(DateFormat('dd-MM-yyyy').format(checkIn)),
      TextCellValue(DateFormat('hh:mm a').format(checkIn)),
      TextCellValue(DateFormat('hh:mm a').format(checkOut)),
    ]);
  }

  // ===== Totals at Bottom =====
  sheet.appendRow([]);
  sheet.appendRow([
    TextCellValue("Total Present Days"),
    TextCellValue(presentDays.toString())
  ]);
  sheet.appendRow([
    TextCellValue("Total Login Hours"),
    TextCellValue("${totalDuration.inHours}h ${totalDuration.inMinutes % 60}m")
  ]);

  // Encode to base64
  var fileBytes = excel.encode();
  var base64String = base64Encode(fileBytes!);
  return 'data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64,$base64String';
}
