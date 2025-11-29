import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/call_logs_dashboard/components/call_logs_header/call_logs_header_widget.dart';
import '/components/calllog_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/cstm_side_nav_bar/cstm_side_nav_bar_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'call_logs_dash_board_copy_widget.dart' show CallLogsDashBoardCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CallLogsDashBoardCopyModel
    extends FlutterFlowModel<CallLogsDashBoardCopyWidget> {
  ///  Local state fields for this page.

  List<CallLogSummeryStruct> callLogs = [];
  void addToCallLogs(CallLogSummeryStruct item) => callLogs.add(item);
  void removeFromCallLogs(CallLogSummeryStruct item) => callLogs.remove(item);
  void removeAtIndexFromCallLogs(int index) => callLogs.removeAt(index);
  void insertAtIndexInCallLogs(int index, CallLogSummeryStruct item) =>
      callLogs.insert(index, item);
  void updateCallLogsAtIndex(
          int index, Function(CallLogSummeryStruct) updateFn) =>
      callLogs[index] = updateFn(callLogs[index]);

  ///  State fields for stateful widgets in this page.

  List<CallLogsRecord>? callLogsDashBoardCopyPreviousSnapshot;
  // Stores action output result for [Firestore Query - Query a collection] action in CallLogsDashBoardCopy widget.
  List<CallLogsRecord>? initCallLogs;
  // Model for AccCallLogsHeader.
  late CallLogsHeaderModel accCallLogsHeaderModel;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<CallLogsRecord>();
  // Model for CstmSideNavBar component.
  late CstmSideNavBarModel cstmSideNavBarModel;

  @override
  void initState(BuildContext context) {
    accCallLogsHeaderModel = createModel(context, () => CallLogsHeaderModel());
    cstmSideNavBarModel = createModel(context, () => CstmSideNavBarModel());
  }

  @override
  void dispose() {
    accCallLogsHeaderModel.dispose();
    paginatedDataTableController.dispose();
    cstmSideNavBarModel.dispose();
  }
}
