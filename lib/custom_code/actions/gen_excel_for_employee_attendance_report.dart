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

import 'package:flutter/material.dart' hide Border, BorderStyle;

import 'dart:convert';
import 'package:excel/excel.dart' as ex;
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> genExcelForEmployeeAttendanceReport(
  List<AttendanceRecord> doc,
  String outletId,
  String employeeId,
) async {
  DateTime now = DateTime.now();
  String currentMonth = DateFormat('MM-yyyy').format(now);

  // Filter data only for employee
  List<AttendanceRecord> filteredDoc =
      doc.where((record) => record.userId == employeeId).toList();

  var excel = ex.Excel.createExcel();
  var sheet = excel['Sheet1'];
  // ✅ Sort by date
  filteredDoc.sort((a, b) => a.createdDate!.compareTo(b.createdDate!));

  // ✅ Detect start & end dates from filteredDoc instead of current month
  DateTime reportStart = filteredDoc.first.createdDate!;
  DateTime reportEnd = filteredDoc.last.createdDate!;

  // ✅ Title now reflects selected range (e.g., Aug 2025 – Aug 2025)
  String monthName = DateFormat('MMMM').format(reportStart);
  String year = DateFormat('yyyy').format(reportStart);

  // Employee details
  String empName = employeeId;
  String empState = employeeId;
  String empCity = employeeId;
  var snapshot = await FirebaseFirestore.instance
      .collection('USER_PROFILE')
      .doc(employeeId)
      .get();

  // Manager name lookup
  String managerName = "N/A";
  var snapshot2 = await FirebaseFirestore.instance
      .collection('OUTLET')
      .doc(outletId)
      .collection('TEAM_TREE')
      .where('userProfileId', isEqualTo: employeeId)
      .limit(1)
      .get();

  if (snapshot2.docs.isNotEmpty) {
    final teamData = snapshot2.docs.first.data();
    if (teamData.containsKey('teamHeadProfileId')) {
      final String managerId = teamData['teamHeadProfileId'];
      if (managerId.isNotEmpty) {
        var managerSnap = await FirebaseFirestore.instance
            .collection('USER_PROFILE')
            .doc(managerId)
            .get();
        if (managerSnap.exists) {
          final mdata = managerSnap.data() as Map<String, dynamic>;
          managerName = (mdata['name'] ?? managerId).toString();
        }
      }
    }
  }

  if (snapshot.exists) {
    empName = snapshot['name'] ?? employeeId;
    empState = snapshot['state'] ?? employeeId;
    if (snapshot.data()!.containsKey('cityList')) {
      List<dynamic> cities = snapshot['cityList'];
      if (cities.isNotEmpty) {
        empCity = cities.first.toString();
      }
    }
  }

  // Title Row
  sheet.merge(
    ex.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0),
    ex.CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: 0),
  );
  sheet.cell(ex.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0)).value =
      ex.TextCellValue('ATTENDANCE REPORT OF $empName - $monthName $year');
  sheet
          .cell(ex.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0))
          .cellStyle =
      ex.CellStyle(
          bold: true, horizontalAlign: ex.HorizontalAlign.Center, fontSize: 16);

  List<List<String>> employeeInfo = [
    ['Month :', '$monthName-$year'],
    ['Employee Name :', empName],
    ['Company Name :', 'DEYE Inverter Technology Pvt Ltd'],
    ['Location Name :', empCity],
    ['State Name :', empState],
    ['Manager Name :', managerName],
  ];

  for (var rowValues in employeeInfo) {
    int rowIndex = sheet.maxRows;
    List<ex.TextCellValue> row =
        rowValues.map((v) => ex.TextCellValue(v)).toList();
    sheet.appendRow(row);

    // Apply bold and borders
    for (int col = 0; col < row.length; col++) {
      var cell = sheet.cell(
          ex.CellIndex.indexByColumnRow(columnIndex: col, rowIndex: rowIndex));
      cell.cellStyle = ex.CellStyle(
        bold: true,
        horizontalAlign: ex.HorizontalAlign.Left,
        verticalAlign: ex.VerticalAlign.Center,
        bottomBorder: ex.Border(borderStyle: ex.BorderStyle.Thin),
        topBorder: ex.Border(borderStyle: ex.BorderStyle.Thin),
        leftBorder: ex.Border(borderStyle: ex.BorderStyle.Thin),
        rightBorder: ex.Border(borderStyle: ex.BorderStyle.Thin),
      );
    }
  }

  sheet.appendRow(List.filled(7, ex.TextCellValue('')));

  // Table Headers
  List<String> headers = [
    'Date',
    'Day',
    'Check-In Time',
    'Check-In Address',
    'Check-Out Time',
    'Check-Out Address',
    'Duration'
  ];
  sheet.appendRow(headers.map((h) => ex.TextCellValue(h)).toList());

  int headerRowIndex = sheet.maxRows - 1;
  for (int col = 0; col < headers.length; col++) {
    var cell = sheet.cell(ex.CellIndex.indexByColumnRow(
        columnIndex: col, rowIndex: headerRowIndex));
    cell.cellStyle = ex.CellStyle(
      bold: true,
      horizontalAlign: ex.HorizontalAlign.Center,
      verticalAlign: ex.VerticalAlign.Center,
      bottomBorder: ex.Border(borderStyle: ex.BorderStyle.Thin),
      topBorder: ex.Border(borderStyle: ex.BorderStyle.Thin),
      leftBorder: ex.Border(borderStyle: ex.BorderStyle.Thin),
      rightBorder: ex.Border(borderStyle: ex.BorderStyle.Thin),
    );
  }

  int totalPresentDays = 0;
  Duration totalDuration = Duration.zero;
  // ✅ Generate all days of report month (not current system month)
  DateTime firstDayOfMonth = DateTime(reportStart.year, reportStart.month, 1);
  DateTime lastDayOfMonth =
      DateTime(reportStart.year, reportStart.month + 1, 0);

  for (DateTime d = firstDayOfMonth;
      d.isBefore(lastDayOfMonth.add(Duration(days: 1)));
      d = d.add(Duration(days: 1))) {
    String dayId = DateFormat('dd-MM-yyyy').format(d);
    String weekDay = DateFormat('EEEE').format(d);

    AttendanceRecord? record = filteredDoc
        .where((r) => r.dayId == dayId)
        .cast<AttendanceRecord?>()
        .firstOrNull;

    String checkIn = "--";
    String checkOut = "--";
    String checkInAddr = "--";
    String checkOutAddr = "--";
    String hrsText = "--";

    if (record != null) {
      checkIn = DateFormat('hh:mm a')
          .format(DateTime.fromMillisecondsSinceEpoch(record.checkInTime));

      checkOut = record.checkOutTime == 0
          ? "6:30 PM"
          : DateFormat('hh:mm a')
              .format(DateTime.fromMillisecondsSinceEpoch(record.checkOutTime));

      if (record.checkInLocationDetails != null) {
        var d = record.checkInLocationDetails!;
        checkInAddr =
            "${d.street ?? ''}, ${d.subLocality ?? ''}, ${d.locality ?? ''}, ${d.postalCode ?? ''}";
      }
      if (record.checkOutLocationDetails != null) {
        var d = record.checkOutLocationDetails!;
        checkOutAddr =
            "${d.street ?? ''}, ${d.subLocality ?? ''}, ${d.locality ?? ''}, ${d.postalCode ?? ''}";
      }

      if (checkInAddr.trim().isEmpty)
        checkInAddr = record.checkInLocation ?? '';
      if (checkOutAddr.trim().isEmpty)
        checkOutAddr = record.checkOutLocation ?? '';

      DateTime inTime = DateFormat('hh:mm a').parse(checkIn);
      DateTime outTime = DateFormat('hh:mm a').parse(checkOut);
      Duration duration = outTime.difference(inTime);
      hrsText = '${duration.inHours}h ${duration.inMinutes % 60}m';

      totalPresentDays++;
      totalDuration += duration;
    }

    // Append row
    int rowIndex = sheet.maxRows;
    List<ex.TextCellValue> row = [
      ex.TextCellValue(dayId),
      ex.TextCellValue(weekDay),
      ex.TextCellValue(checkIn),
      ex.TextCellValue(checkInAddr),
      ex.TextCellValue(checkOut),
      ex.TextCellValue(checkOutAddr),
      ex.TextCellValue(hrsText),
    ];
    sheet.appendRow(row);

    // Apply style (highlight Sunday in red)
    for (int col = 0; col < row.length; col++) {
      var cell = sheet.cell(
          ex.CellIndex.indexByColumnRow(columnIndex: col, rowIndex: rowIndex));
      cell.cellStyle = ex.CellStyle(
        horizontalAlign: ex.HorizontalAlign.Left,
        verticalAlign: ex.VerticalAlign.Center,
        bottomBorder: ex.Border(borderStyle: ex.BorderStyle.Thin),
        topBorder: ex.Border(borderStyle: ex.BorderStyle.Thin),
        leftBorder: ex.Border(borderStyle: ex.BorderStyle.Thin),
        rightBorder: ex.Border(borderStyle: ex.BorderStyle.Thin),
        backgroundColorHex:
            weekDay == "Sunday" ? ex.ExcelColor.red : ex.ExcelColor.white,
      );
    }
  }

  // Summary rows
  sheet.appendRow(List.filled(7, ex.TextCellValue('')));
  int summaryRow1 = sheet.maxRows;
  sheet.appendRow([
    ex.TextCellValue('Total Present Days'),
    ex.TextCellValue(totalPresentDays.toString())
  ]);
  int summaryRow2 = sheet.maxRows;
  sheet.appendRow([
    ex.TextCellValue('Total Login Hours'),
    ex.TextCellValue(
        '${totalDuration.inHours}h ${totalDuration.inMinutes % 60}m')
  ]);

  for (int col = 0; col < 2; col++) {
    var c1 = sheet.cell(
        ex.CellIndex.indexByColumnRow(columnIndex: col, rowIndex: summaryRow1));
    var c2 = sheet.cell(
        ex.CellIndex.indexByColumnRow(columnIndex: col, rowIndex: summaryRow2));
    c1.cellStyle = ex.CellStyle(
      bold: true,
      bottomBorder: ex.Border(borderStyle: ex.BorderStyle.Thin),
      topBorder: ex.Border(borderStyle: ex.BorderStyle.Thin),
      leftBorder: ex.Border(borderStyle: ex.BorderStyle.Thin),
      rightBorder: ex.Border(borderStyle: ex.BorderStyle.Thin),
    );
    c2.cellStyle = ex.CellStyle(
      bold: true,
      bottomBorder: ex.Border(borderStyle: ex.BorderStyle.Thin),
      topBorder: ex.Border(borderStyle: ex.BorderStyle.Thin),
      leftBorder: ex.Border(borderStyle: ex.BorderStyle.Thin),
      rightBorder: ex.Border(borderStyle: ex.BorderStyle.Thin),
    );
  }

  var fileBytes = excel.encode();
  return 'data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64,${base64Encode(fileBytes!)}';
}
