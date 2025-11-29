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

Future<List<LeadsManagementRecord>> getSortedComplaintsAssignedDateTime(
    List<LeadsManagementRecord> leadDocs) async {
  // Add your function code here!

  // Sort the list based on the last assignedDateTime in assignedToHistory
  leadDocs.sort((a, b) {
    final aLast = a.assignedToHistory.isNotEmpty
        ? a.assignedToHistory.last.assignedDateTime
        : null;
    final bLast = b.assignedToHistory.isNotEmpty
        ? b.assignedToHistory.last.assignedDateTime
        : null;

    if (aLast == null && bLast == null) return 0;
    if (aLast == null) return 1;
    if (bLast == null) return -1;

    // Sort by latest assignedDateTime first
    return bLast.compareTo(aLast);
  });

  // Update app state: allow registering a new complaint only if latest is completed
  if (leadDocs.isNotEmpty &&
      leadDocs.first.stage?.toLowerCase() == 'completed') {
    FFAppState().canRegisterNewComplaintManual = true;
  } else {
    FFAppState().canRegisterNewComplaintManual = false;
  }

  // Return sorted complaints
  return leadDocs;
}
