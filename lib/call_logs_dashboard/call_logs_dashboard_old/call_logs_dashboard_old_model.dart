import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/custom_date_range/custom_date_range_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'call_logs_dashboard_old_widget.dart' show CallLogsDashboardOldWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CallLogsDashboardOldModel
    extends FlutterFlowModel<CallLogsDashboardOldWidget> {
  ///  Local state fields for this page.

  List<String> callLogs = [];
  void addToCallLogs(String item) => callLogs.add(item);
  void removeFromCallLogs(String item) => callLogs.remove(item);
  void removeAtIndexFromCallLogs(int index) => callLogs.removeAt(index);
  void insertAtIndexInCallLogs(int index, String item) =>
      callLogs.insert(index, item);
  void updateCallLogsAtIndex(int index, Function(String) updateFn) =>
      callLogs[index] = updateFn(callLogs[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
