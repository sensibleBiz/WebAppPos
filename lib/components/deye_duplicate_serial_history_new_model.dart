import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'deye_duplicate_serial_history_new_widget.dart'
    show DeyeDuplicateSerialHistoryNewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeyeDuplicateSerialHistoryNewModel
    extends FlutterFlowModel<DeyeDuplicateSerialHistoryNewWidget> {
  ///  Local state fields for this component.

  List<LeadsManagementRecord> leadDocs = [];
  void addToLeadDocs(LeadsManagementRecord item) => leadDocs.add(item);
  void removeFromLeadDocs(LeadsManagementRecord item) => leadDocs.remove(item);
  void removeAtIndexFromLeadDocs(int index) => leadDocs.removeAt(index);
  void insertAtIndexInLeadDocs(int index, LeadsManagementRecord item) =>
      leadDocs.insert(index, item);
  void updateLeadDocsAtIndex(
          int index, Function(LeadsManagementRecord) updateFn) =>
      leadDocs[index] = updateFn(leadDocs[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in DeyeDuplicateSerialHistoryNew widget.
  List<LeadsManagementRecord>? leadDocsFetched;
  // Stores action output result for [Custom Action - getSortedComplaintsAssignedDateTime] action in DeyeDuplicateSerialHistoryNew widget.
  List<LeadsManagementRecord>? leadDocsSorted;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
