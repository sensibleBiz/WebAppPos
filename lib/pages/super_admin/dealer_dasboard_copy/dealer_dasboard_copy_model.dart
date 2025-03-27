import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dealer_dasboard_copy_widget.dart' show DealerDasboardCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DealerDasboardCopyModel
    extends FlutterFlowModel<DealerDasboardCopyWidget> {
  ///  Local state fields for this page.

  String filter = 'today';

  bool viewByDeaer = true;

  List<LeadsManagementRecord> leadDocs = [];
  void addToLeadDocs(LeadsManagementRecord item) => leadDocs.add(item);
  void removeFromLeadDocs(LeadsManagementRecord item) => leadDocs.remove(item);
  void removeAtIndexFromLeadDocs(int index) => leadDocs.removeAt(index);
  void insertAtIndexInLeadDocs(int index, LeadsManagementRecord item) =>
      leadDocs.insert(index, item);
  void updateLeadDocsAtIndex(
          int index, Function(LeadsManagementRecord) updateFn) =>
      leadDocs[index] = updateFn(leadDocs[index]);

  List<dynamic> leadJson = [];
  void addToLeadJson(dynamic item) => leadJson.add(item);
  void removeFromLeadJson(dynamic item) => leadJson.remove(item);
  void removeAtIndexFromLeadJson(int index) => leadJson.removeAt(index);
  void insertAtIndexInLeadJson(int index, dynamic item) =>
      leadJson.insert(index, item);
  void updateLeadJsonAtIndex(int index, Function(dynamic) updateFn) =>
      leadJson[index] = updateFn(leadJson[index]);

  List<OutletLeadsRecord> outletLeadJson = [];
  void addToOutletLeadJson(OutletLeadsRecord item) => outletLeadJson.add(item);
  void removeFromOutletLeadJson(OutletLeadsRecord item) =>
      outletLeadJson.remove(item);
  void removeAtIndexFromOutletLeadJson(int index) =>
      outletLeadJson.removeAt(index);
  void insertAtIndexInOutletLeadJson(int index, OutletLeadsRecord item) =>
      outletLeadJson.insert(index, item);
  void updateOutletLeadJsonAtIndex(
          int index, Function(OutletLeadsRecord) updateFn) =>
      outletLeadJson[index] = updateFn(outletLeadJson[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in DealerDasboardCopy widget.
  List<DealersRecord>? dealerList;
  // Stores action output result for [Firestore Query - Query a collection] action in DealerDasboardCopy widget.
  List<LeadsManagementRecord>? leadList;
  // Stores action output result for [Firestore Query - Query a collection] action in DealerDasboardCopy widget.
  List<OutletLeadsRecord>? newLeads;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
