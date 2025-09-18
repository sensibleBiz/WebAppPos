import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/send_email_widget.dart';
import '/deye_c_r_m/deye_header/deye_header_widget.dart';
import '/deye_c_r_m/deye_menu/deye_menu_widget.dart';
import '/deye_c_r_m/deye_no_data/deye_no_data_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/custom_date_range/custom_date_range_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'deye_complaint_report_widget.dart' show DeyeComplaintReportWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DeyeComplaintReportModel
    extends FlutterFlowModel<DeyeComplaintReportWidget> {
  ///  Local state fields for this page.

  bool isSearched = false;

  List<String> selectedZone = [];
  void addToSelectedZone(String item) => selectedZone.add(item);
  void removeFromSelectedZone(String item) => selectedZone.remove(item);
  void removeAtIndexFromSelectedZone(int index) => selectedZone.removeAt(index);
  void insertAtIndexInSelectedZone(int index, String item) =>
      selectedZone.insert(index, item);
  void updateSelectedZoneAtIndex(int index, Function(String) updateFn) =>
      selectedZone[index] = updateFn(selectedZone[index]);

  ///  State fields for stateful widgets in this page.

  // Model for DeyeHeader component.
  late DeyeHeaderModel deyeHeaderModel;
  // Stores action output result for [Custom Action - genExcelForComplaintReport] action in Icon widget.
  String? base64Link232;
  // Stores action output result for [Backend Call - API (sendMail)] action in Icon widget.
  ApiCallResponse? apiResult88g;
  // State field(s) for DropDownZoneAll widget.
  String? dropDownZoneAllValue;
  FormFieldController<String>? dropDownZoneAllValueController;
  // State field(s) for DropDownRemarkAll widget.
  String? dropDownRemarkAllValue;
  FormFieldController<String>? dropDownRemarkAllValueController;
  // State field(s) for DropDownSolutionAll widget.
  String? dropDownSolutionAllValue;
  FormFieldController<String>? dropDownSolutionAllValueController;
  // State field(s) for DropDownAll widget.
  String? dropDownAllValue;
  FormFieldController<String>? dropDownAllValueController;
  // State field(s) for TextFieldAll widget.
  FocusNode? textFieldAllFocusNode;
  TextEditingController? textFieldAllTextController;
  String? Function(BuildContext, String?)? textFieldAllTextControllerValidator;
  // Stores action output result for [Custom Action - genExcelForComplaintReport] action in Icon widget.
  String? base64Link2322;
  // Stores action output result for [Backend Call - API (sendMail)] action in Icon widget.
  ApiCallResponse? apiResult88gt;
  // State field(s) for DropDownStageReport widget.
  String? dropDownStageReportValue;
  FormFieldController<String>? dropDownStageReportValueController;
  // State field(s) for DropDownRemarkReport widget.
  String? dropDownRemarkReportValue;
  FormFieldController<String>? dropDownRemarkReportValueController;
  // State field(s) for DropDownSolutionReport widget.
  String? dropDownSolutionReportValue;
  FormFieldController<String>? dropDownSolutionReportValueController;
  // State field(s) for DropDownReport widget.
  String? dropDownReportValue;
  FormFieldController<String>? dropDownReportValueController;
  // State field(s) for TextFieldReport widget.
  FocusNode? textFieldReportFocusNode;
  TextEditingController? textFieldReportTextController;
  String? Function(BuildContext, String?)?
      textFieldReportTextControllerValidator;
  // Model for DeyeMenu component.
  late DeyeMenuModel deyeMenuModel;

  @override
  void initState(BuildContext context) {
    deyeHeaderModel = createModel(context, () => DeyeHeaderModel());
    deyeMenuModel = createModel(context, () => DeyeMenuModel());
  }

  @override
  void dispose() {
    deyeHeaderModel.dispose();
    textFieldAllFocusNode?.dispose();
    textFieldAllTextController?.dispose();

    textFieldReportFocusNode?.dispose();
    textFieldReportTextController?.dispose();

    deyeMenuModel.dispose();
  }
}
