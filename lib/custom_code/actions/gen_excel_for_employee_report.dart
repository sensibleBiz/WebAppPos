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

import 'package:path_provider/path_provider.dart';
import 'package:excel/excel.dart';

Future<String> genExcelForEmployeeReport(
  String? startdate,
  String? shopName,
  List<LeadsManagementRecord>? docList,
  String? empName,
) async {
  // Add your function code here!
  // Add your function code here!
  var excel = Excel.createExcel();
  var sheet = excel['Sheet1'];
  CellStyle boldStyle = CellStyle(bold: true);

  double totalBillAmount = 0;
  double totalTaxAmount = 0;
  double totalDiscountAmount = 0;
  double totalDeliveyChargAmount = 0;

  // Add headers to the sheet
  sheet.appendRow([
    TextCellValue('Shop Name'),
    TextCellValue(shopName ?? ''),
  ]);

  sheet.appendRow([
    TextCellValue('Report Date'),
    TextCellValue(startdate ?? ''),
  ]);

  sheet.appendRow([
    TextCellValue('Employee Name'),
    TextCellValue(empName ?? ''),
  ]);

  sheet.appendRow([TextCellValue('')]); // Add an empty row for spacing

  // Add product details to the sheet
  sheet.appendRow([
    TextCellValue('Complaint No.'),
    TextCellValue('Customer Name'),
    TextCellValue('Mobile No.'),
    TextCellValue('State'),
    TextCellValue('City'),
    TextCellValue('Purchased From'),
    TextCellValue('Product Type'),
    TextCellValue('Product Capacity'),
    TextCellValue('Serial No.'),
    TextCellValue('Service Issue'),
    TextCellValue('Engineer Name'),
    TextCellValue('Action Taken'),
    TextCellValue('Status'),
    TextCellValue('Remark'),
    TextCellValue('Comments'),
    TextCellValue('Closed Date'),
  ]);

  List<int> boldColumns = [0, 1, 2, 3];
  List<int> boldRows = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];

  for (int columnIndex in boldColumns) {
    var cell = sheet.cell(
        CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: columnIndex));
    cell.cellStyle = boldStyle;
  }

  for (int rowIndex in boldRows) {
    var cell = sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: rowIndex, rowIndex: 3));
    cell.cellStyle = boldStyle;
  }

  for (var product in docList!) {
    var querySnapshot = await FirebaseFirestore.instance
        .collection('OUTLET')
        .doc(FFAppState().outletRef?.id)
        .collection('LEAD_ACTIVITIES')
        .where('leadRefId', isEqualTo: product.reference.id)
        .get();

    String requirements = querySnapshot.docs.isNotEmpty
        ? querySnapshot.docs.map((doc) => doc['description']).join(', ')
        : 'N/A';

    var querySnapshot2 = await FirebaseFirestore.instance
        .collection('USER_PROFILE')
        .where('id', isEqualTo: product.assignedTo)
        .get();

    var querySnapshot3 = await FirebaseFirestore.instance
        .collection('OUTLET')
        .doc(FFAppState().outletRef?.id)
        .collection('CATEGORY')
        .where('id', isEqualTo: product.customFields.productType)
        .get();

    var querySnapshot4 = await FirebaseFirestore.instance
        .collection('OUTLET')
        .doc(FFAppState().outletRef?.id)
        .collection('PRODUCT')
        .where('id', isEqualTo: product.customFields.capacity)
        .get();

    String capacity = querySnapshot4.docs.isNotEmpty
        ? querySnapshot4.docs.map((doc) => doc['name']).join(', ')
        : 'N/A';

    String productType = querySnapshot3.docs.isNotEmpty
        ? querySnapshot3.docs.map((doc) => doc['name']).join(', ')
        : 'N/A';

    String userName = querySnapshot2.docs.isNotEmpty
        ? querySnapshot2.docs.map((doc) => doc['name']).join(', ')
        : 'N/A';

    sheet.appendRow([
      TextCellValue(product.ticket),
      TextCellValue(product.username),
      TextCellValue(product.mobile),
      TextCellValue(product.state),
      TextCellValue(product.city),
      TextCellValue(product.customFields.purchasedFrom),
      TextCellValue(productType),
      TextCellValue(capacity),
      TextCellValue(product.customFields.serial.toString()),
      TextCellValue(product.requirement),
      TextCellValue(userName),
      TextCellValue(requirements),
      TextCellValue(product.status),
      TextCellValue(product.remarks),
      TextCellValue(product.comments),
      TextCellValue(product.closeDate),
    ]);
  }

  sheet.appendRow([TextCellValue('')]);
  sheet.appendRow([TextCellValue('')]);

  // sheet.appendRow([
  //   TextCellValue('Total'),
  //   TextCellValue(totalqty.toString()),
  //   TextCellValue(''),
  //   TextCellValue(totalAmt.toString()),
  // ]);
  // Add total tax amount to the sheet
  // Encode the Excel file
  var fileBytes = excel.encode();

  // Convert bytes to base64
  var base64String = base64Encode(fileBytes!);

  // Prepare data URI
  var dataUri =
      'data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64,$base64String';
  print(dataUri);
  return dataUri;
}
