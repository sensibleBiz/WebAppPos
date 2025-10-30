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

import 'dart:convert';

import 'package:path_provider/path_provider.dart';
import 'package:excel/excel.dart';
import 'package:collection/collection.dart';

Future<String> genExcelForComplaintReport(
  BuildContext context,
  String? startdate,
  String? shopName,
  List<LeadsManagementRecord>? docList,
) async {
  // Add your function code here!
  double progress = 0.0; // Progress from 0.0 to 1.0
  late void Function(void Function()) dialogSetState;

  // Show loading dialog with StatefulBuilder
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          dialogSetState = setState; // Save reference to call later
          return AlertDialog(
            title: Text('Generating Excel Report'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LinearProgressIndicator(value: progress),
                SizedBox(height: 10),
                Text('${(progress * 100).toStringAsFixed(0)}% completed'),
              ],
            ),
          );
        },
      );
    },
  );

  String dataUri = '';
  try {
    var excel = Excel.createExcel();
    var sheet = excel['Sheet1'];
    CellStyle boldStyle = CellStyle(bold: true);

    // Track the current row dynamically
    int currentRow = 0;

    // Add meta rows (bold first column)
    List<List<String?>> metaRows = [
      ['Shop Name', shopName],
      ['Report Date', startdate],
    ];

    for (var row in metaRows) {
      sheet.appendRow(row.map((e) => TextCellValue(e ?? '')).toList());
      // Make first column bold
      sheet
          .cell(
              CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: currentRow))
          .cellStyle = boldStyle;
      currentRow++;
    }

    // Add an empty row for spacing
    sheet.appendRow([TextCellValue('')]);
    currentRow++;

    // Add header row
    List<String> headers = [
      'Complaint No.',
      'Customer Name',
      'Mobile No.',
      'State',
      'City',
      'Purchased From',
      'Product Type',
      'Product Capacity',
      'Serial No.',
      'Service Issue',
      'Engineer Name',
      'Action Taken',
      'Status',
      'Remark',
      'Comments',
      'Closed Date',
    ];

    sheet.appendRow(headers.map((e) => TextCellValue(e)).toList());

    // Make the entire header row bold dynamically
    for (int col = 0; col < headers.length; col++) {
      sheet
          .cell(CellIndex.indexByColumnRow(
              columnIndex: col, rowIndex: currentRow))
          .cellStyle = boldStyle;
    }
    // currentRow++; // Move to first data row

    // Loop through data and update progress
    for (int i = 0; i < (docList?.length ?? 0); i++) {
      var product = docList![i];

      // Get requirements from Firestore
      var querySnapshot = await FirebaseFirestore.instance
          .collection('OUTLET')
          .doc(FFAppState().outletRef?.id)
          .collection('LEAD_ACTIVITIES')
          .where('leadRefId', isEqualTo: product.reference.id)
          .get();

      String requirements = querySnapshot.docs.isNotEmpty
          ? querySnapshot.docs.map((doc) => doc['description']).join(', ')
          : 'N/A';

      // Get cached lookups
      final capacityItem = FFAppState()
          .productsList
          .firstWhereOrNull((item) => item.id == product.customFields.capacity);
      final capacity = capacityItem?.name ?? 'N/A';

      final productTypeItem = FFAppState().categoryList.firstWhereOrNull(
          (item) => item.id == product.customFields.productType);
      final productType = productTypeItem?.name ?? 'N/A';

      final userItem = FFAppState()
          .TeamTreeUsers
          .firstWhereOrNull((user) => user.userProfileId == product.assignedTo);
      final userName = userItem?.username ?? 'N/A';

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

      // Update progress using dialog's setState
      progress = (i + 1) / docList!.length;
      dialogSetState(() {}); // <-- this triggers the UI update
      await Future.delayed(Duration(milliseconds: 50));
    }

    sheet.appendRow([TextCellValue('')]);
    sheet.appendRow([TextCellValue('')]);

    // Encode Excel file
    var fileBytes = excel.encode();
    dataUri =
        'data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64,${base64Encode(fileBytes!)}';
  } finally {
    Navigator.of(context).pop(); // Close the dialog
  }

  return dataUri;
}
