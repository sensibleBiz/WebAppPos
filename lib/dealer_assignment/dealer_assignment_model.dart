import '/backend/backend.dart';
import '/components/add_follow_up_widget.dart';
import '/components/call_details_widget.dart';
import '/components/custom_date_range_widget.dart';
import '/components/list_view_msg_widget.dart';
import '/components/test_dropdown_copy_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dealer_assignment_widget.dart' show DealerAssignmentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DealerAssignmentModel extends FlutterFlowModel<DealerAssignmentWidget> {
  ///  Local state fields for this page.

  bool isAll = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
