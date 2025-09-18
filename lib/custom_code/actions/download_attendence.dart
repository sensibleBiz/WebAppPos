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

import 'dart:convert';

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:excel/excel.dart';

Future<String> downloadAttendence(
  List<AttendanceRecord> doc,
  String outletId,
) async {
  // Create Excel file
  var excel = Excel.createExcel();
  var sheet = excel['Sheet1'];

  String monthName = '';
  String year = '';
  if (doc.isNotEmpty) {
    // Assuming record.dayId is in format like "dd-MM-yyyy" or you can use createdDate for exact date
    DateTime firstDate;

    // If dayId is a string date, parse it:
    try {
      firstDate = DateFormat('dd-MM-yyyy').parse(doc[0].dayId);
    } catch (e) {
      // Fallback: if parsing fails, use createdDate from the record
      firstDate = DateTime.fromMillisecondsSinceEpoch(
          doc[0].createdDate!.millisecondsSinceEpoch);
    }

    monthName = DateFormat('MMMM').format(firstDate); // e.g. May
    year = DateFormat('yyyy').format(firstDate); // e.g. 2025
  } else {
    // default fallback values if no records
    monthName = 'Unknown';
    year = '';
  }

  List<String> dayList = [];
  doc.sort((a, b) => a.createdDate!.compareTo(b.createdDate!));

  for (var record in doc) {
    if (!dayList.contains(record.dayId)) {
      dayList.add(record.dayId);
    }
  }

  // Initialize map to hold attendance data
  Map<String, Map<String, Map<String, String>>> attendanceMap = {};

  for (var record in doc) {
    if (!attendanceMap.containsKey(record.dayId)) {
      attendanceMap[record.dayId] = {};
    }
    attendanceMap[record.dayId]?[record.userId] = {
      "in": DateFormat('hh:mm a')
          .format(DateTime.fromMillisecondsSinceEpoch(record.checkInTime))
          .toString(),
      "out": record.checkOutTime == 0
          ? "6:30 PM"
          : DateFormat('hh:mm a')
              .format(DateTime.fromMillisecondsSinceEpoch(record.checkOutTime))
              .toString(),
    };
  }

  // Write header
  List<String> headers = ['Day'];
  List<String> headerId = [];
  Set<String> userIds = {};
  for (var record in doc) {
    userIds.add(record.userId);
  }

  // Fetch user profile info
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('USER_PROFILE')
      .where('outletId', isEqualTo: outletId)
      .get()
      .then((value) => value);

  if (querySnapshot.size == 0) {
    print('No matching documents.');
  } else {
    for (int x = 0; x < querySnapshot.docs.length; x++) {
      var edata = querySnapshot.docs[x];
      for (var userId in userIds) {
        if (userId == edata.id) {
          headers.add(edata["name"]);
          headerId.add(edata["id"]);
          break;
        }
      }
    }
  }

  // Add Title row merged across columns
  int totalCols = headers.length;
  sheet.merge(
    CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0),
    CellIndex.indexByColumnRow(columnIndex: totalCols - 1, rowIndex: 0),
  );

  sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0)).value =
      TextCellValue('ATTENDANCE REPORT OF MONTH - $monthName - $year');

  sheet
      .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0))
      .cellStyle = CellStyle(
    bold: true,
    horizontalAlign: HorizontalAlign.Center,
    fontSize: 16,
  );

  // Leave 1 empty row after title
  // Write header at row 2 (index 2)
  sheet.appendRow(List.filled(headers.length, TextCellValue('')));

  // Append headers
  sheet.appendRow(headers.map((header) => TextCellValue(header)).toList());
  // Get the row index of the appended header row
  int headerRowIndex = sheet.maxRows - 1; // last appended row

// Apply style to each cell in the header row
  for (int col = 0; col < headers.length; col++) {
    var cell = sheet.cell(
        CellIndex.indexByColumnRow(columnIndex: col, rowIndex: headerRowIndex));
    cell.cellStyle = CellStyle(
      bold: true,
      fontSize: 10,
      horizontalAlign: HorizontalAlign.Center,
    );
  }
  // sheet.appendRow(headerId.map((headeri) => TextCellValue(headeri)).toList());

  // Prepare accumulators for totals
  Map<String, int> totalPresentDays = {};
  Map<String, Duration> totalDurations = {};

  for (var userId in headerId) {
    totalPresentDays[userId] = 0;
    totalDurations[userId] = Duration.zero;
  }

  // Write attendance data per day
  for (var day in dayList) {
    List<String> row = [day];
    for (var userId in headerId) {
      var userAttendance = attendanceMap[day]?[userId];
      if (userAttendance != null) {
        String checkIn = userAttendance["in"]!;
        String checkOut = userAttendance["out"]!;

        // Parse timestamps
        DateTime checkInTime = DateFormat('hh:mm a').parse(checkIn);
        DateTime checkOutTime = DateFormat('hh:mm a').parse(checkOut);

        // Compute duration
        Duration duration = checkOutTime.difference(checkInTime);

        // Update totals
        totalPresentDays[userId] = totalPresentDays[userId]! + 1;
        totalDurations[userId] = totalDurations[userId]! + duration;

        String hrsText = '${duration.inHours}h ${duration.inMinutes % 60}m';
        String combined = '$checkIn : $checkOut ($hrsText)';
        row.add(combined);
      } else {
        row.add('');
      }
    }
    sheet.appendRow(row.map((value) => TextCellValue(value)).toList());
  }

  sheet.appendRow(List.filled(headers.length, TextCellValue('')));

  // Add total present days row
  List<String> totalDaysRow = ['Total Present Days'];
  for (var userId in headerId) {
    totalDaysRow.add(totalPresentDays[userId].toString());
  }
  sheet.appendRow(totalDaysRow.map((value) => TextCellValue(value)).toList());
  int totalDaysRowIndex = sheet.maxRows - 1;
  sheet
      .cell(CellIndex.indexByColumnRow(
          columnIndex: 0, rowIndex: totalDaysRowIndex))
      .cellStyle = CellStyle(bold: true);

  // Add total login hours row
  List<String> totalHoursRow = ['Total Login Hours'];
  for (var userId in headerId) {
    Duration dur = totalDurations[userId]!;
    String hoursStr = '${dur.inHours}h ${dur.inMinutes % 60}m';
    totalHoursRow.add(hoursStr);
  }
  sheet.appendRow(totalHoursRow.map((value) => TextCellValue(value)).toList());
  // Make "Total Login Hours" bold (first cell in that row)
  int totalHoursRowIndex = sheet.maxRows - 1;
  sheet
      .cell(CellIndex.indexByColumnRow(
          columnIndex: 0, rowIndex: totalHoursRowIndex))
      .cellStyle = CellStyle(bold: true);

  // Encode the Excel file
  var fileBytes = excel.encode();

  // Convert bytes to base64
  var base64String = base64Encode(fileBytes!);

  // Prepare data URI
  var dataUri =
      'data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64,$base64String';

  print("-----------------");
  print(dataUri);
  print("-----------------");

  return dataUri;
}
