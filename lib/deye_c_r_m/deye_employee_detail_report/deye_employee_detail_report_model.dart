import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/send_email_widget.dart';
import '/deye_c_r_m/deye_header/deye_header_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/custom_date_range/custom_date_range_widget.dart';
import '/pages/components/list_view_msg/list_view_msg_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'deye_employee_detail_report_widget.dart'
    show DeyeEmployeeDetailReportWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DeyeEmployeeDetailReportModel
    extends FlutterFlowModel<DeyeEmployeeDetailReportWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for DeyeHeader component.
  late DeyeHeaderModel deyeHeaderModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - genExcelForEmployeeReport] action in Icon widget.
  String? base64Link232;
  // Stores action output result for [Backend Call - API (sendMail)] action in Icon widget.
  ApiCallResponse? apiResult88g;

  @override
  void initState(BuildContext context) {
    deyeHeaderModel = createModel(context, () => DeyeHeaderModel());
  }

  @override
  void dispose() {
    deyeHeaderModel.dispose();
  }
}
