import '/backend/backend.dart';
import '/call_logs_dashboard/components/call_logs_header/call_logs_header_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'call_logs_details_copy_widget.dart' show CallLogsDetailsCopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CallLogsDetailsCopyModel
    extends FlutterFlowModel<CallLogsDetailsCopyWidget> {
  ///  Local state fields for this page.

  List<CallLogsRecord> callLogs = [];
  void addToCallLogs(CallLogsRecord item) => callLogs.add(item);
  void removeFromCallLogs(CallLogsRecord item) => callLogs.remove(item);
  void removeAtIndexFromCallLogs(int index) => callLogs.removeAt(index);
  void insertAtIndexInCallLogs(int index, CallLogsRecord item) =>
      callLogs.insert(index, item);
  void updateCallLogsAtIndex(int index, Function(CallLogsRecord) updateFn) =>
      callLogs[index] = updateFn(callLogs[index]);

  ///  State fields for stateful widgets in this page.

  // Model for CallLogsHeader component.
  late CallLogsHeaderModel callLogsHeaderModel;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<CallLogsRecord>();

  @override
  void initState(BuildContext context) {
    callLogsHeaderModel = createModel(context, () => CallLogsHeaderModel());
  }

  @override
  void dispose() {
    callLogsHeaderModel.dispose();
    paginatedDataTableController.dispose();
  }
}
