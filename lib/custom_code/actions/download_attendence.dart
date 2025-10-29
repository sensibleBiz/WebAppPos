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

import 'index.dart'; // Imports other custom actions

import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:excel/excel.dart';
import 'package:intl/intl.dart';

Future<String> downloadAttendence(
  List<AttendanceRecord> doc,
  String outletId,
) async {
  var excel = Excel.createExcel();
  var sheet = excel['Sheet1'];

  String monthName = '';
  String year = '';
  if (doc.isNotEmpty) {
    DateTime firstDate;
    try {
      firstDate = DateFormat('dd-MM-yyyy').parse(doc[0].dayId);
    } catch (e) {
      firstDate = DateTime.fromMillisecondsSinceEpoch(
          doc[0].createdDate!.millisecondsSinceEpoch);
    }
    monthName = DateFormat('MMMM').format(firstDate);
    year = DateFormat('yyyy').format(firstDate);
  } else {
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

  Map<String, Map<String, Map<String, String>>> attendanceMap = {};
  for (var record in doc) {
    if (!attendanceMap.containsKey(record.dayId)) {
      attendanceMap[record.dayId] = {};
    }
    attendanceMap[record.dayId]?[record.userId] = {
      "in": record.checkInTime == 0
          ? ""
          : DateFormat('hh:mm a')
              .format(DateTime.fromMillisecondsSinceEpoch(record.checkInTime))
              .toString(),
      "out": record.checkOutTime == 0
          ? ""
          : DateFormat('hh:mm a')
              .format(DateTime.fromMillisecondsSinceEpoch(record.checkOutTime))
              .toString(),
    };
  }

  // headers -> add Day column
  List<String> headers = ['Date', 'Day'];
  List<String> headerId = [];
  Set<String> userIds = {};
  for (var record in doc) {
    userIds.add(record.userId);
  }

  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('USER_PROFILE')
      .where('outletId', isEqualTo: outletId)
      .get();

  if (querySnapshot.size > 0) {
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

  sheet.appendRow(List.filled(headers.length, TextCellValue('')));
  sheet.appendRow(headers.map((header) => TextCellValue(header)).toList());

  int headerRowIndex = sheet.maxRows - 1;
  for (int col = 0; col < headers.length; col++) {
    var cell = sheet.cell(
        CellIndex.indexByColumnRow(columnIndex: col, rowIndex: headerRowIndex));
    cell.cellStyle = CellStyle(
      bold: true,
      fontSize: 10,
      horizontalAlign: HorizontalAlign.Center,
    );
  }

  Map<String, int> totalPresentDays = {};
  Map<String, Duration> totalDurations = {};
  for (var userId in headerId) {
    totalPresentDays[userId] = 0;
    totalDurations[userId] = Duration.zero;
  }

  for (var day in dayList) {
    DateTime date = DateFormat('dd-MM-yyyy').parse(day);
    String dayName = DateFormat('EEEE').format(date);

    List<String> row = [day, dayName];
    for (var userId in headerId) {
      var userAttendance = attendanceMap[day]?[userId];
      if (userAttendance != null && userAttendance["in"]!.isNotEmpty) {
        String checkIn = userAttendance["in"]!;
        String checkOut =
            userAttendance["out"]!.isEmpty ? "6:30 PM" : userAttendance["out"]!;

        DateTime checkInTime = DateFormat('hh:mm a').parse(checkIn);
        DateTime checkOutTime = DateFormat('hh:mm a').parse(checkOut);
        Duration duration = checkOutTime.difference(checkInTime);

        totalPresentDays[userId] = totalPresentDays[userId]! + 1;
        totalDurations[userId] = totalDurations[userId]! + duration;

        String hrsText = '${duration.inHours}h ${duration.inMinutes % 60}m';
        row.add('$checkIn : $checkOut ($hrsText)');
      } else {
        row.add('Absent');
      }
    }

    sheet.appendRow(row.map((value) => TextCellValue(value)).toList());
    int currentRowIndex = sheet.maxRows - 1;

    // If Sunday → mark entire row red
    if (dayName == "Sunday") {
      for (int col = 0; col < headers.length; col++) {
        var cell = sheet.cell(CellIndex.indexByColumnRow(
            columnIndex: col, rowIndex: currentRowIndex));
        cell.cellStyle = CellStyle(
          backgroundColorHex: ExcelColor.red, // light red
        );
      }
    }
  }

  sheet.appendRow(List.filled(headers.length, TextCellValue('')));

  List<String> totalDaysRow = ['Total Present Days', ''];
  for (var userId in headerId) {
    totalDaysRow.add(totalPresentDays[userId].toString());
  }
  sheet.appendRow(totalDaysRow.map((value) => TextCellValue(value)).toList());
  int totalDaysRowIndex = sheet.maxRows - 1;
  sheet
      .cell(CellIndex.indexByColumnRow(
          columnIndex: 0, rowIndex: totalDaysRowIndex))
      .cellStyle = CellStyle(bold: true);

  List<String> totalHoursRow = ['Total Login Hours', ''];
  for (var userId in headerId) {
    Duration dur = totalDurations[userId]!;
    String hoursStr = '${dur.inHours}h ${dur.inMinutes % 60}m';
    totalHoursRow.add(hoursStr);
  }
  sheet.appendRow(totalHoursRow.map((value) => TextCellValue(value)).toList());
  int totalHoursRowIndex = sheet.maxRows - 1;
  sheet
      .cell(CellIndex.indexByColumnRow(
          columnIndex: 0, rowIndex: totalHoursRowIndex))
      .cellStyle = CellStyle(bold: true);

  var fileBytes = excel.encode();
  var base64String = base64Encode(fileBytes!);
  var dataUri =
      'data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64,$base64String';

  return dataUri;
}
