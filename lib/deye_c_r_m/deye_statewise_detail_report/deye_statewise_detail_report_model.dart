import '/backend/backend.dart';
import '/deye_c_r_m/deye_header/deye_header_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/list_view_msg/list_view_msg_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'deye_statewise_detail_report_widget.dart'
    show DeyeStatewiseDetailReportWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeyeStatewiseDetailReportModel
    extends FlutterFlowModel<DeyeStatewiseDetailReportWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for DeyeHeader component.
  late DeyeHeaderModel deyeHeaderModel;

  @override
  void initState(BuildContext context) {
    deyeHeaderModel = createModel(context, () => DeyeHeaderModel());
  }

  @override
  void dispose() {
    deyeHeaderModel.dispose();
  }
}
