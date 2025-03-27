import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'call_details_copy_widget.dart' show CallDetailsCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CallDetailsCopyModel extends FlutterFlowModel<CallDetailsCopyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldDate widget.
  FocusNode? textFieldDateFocusNode;
  TextEditingController? textFieldDateTextController;
  String? Function(BuildContext, String?)? textFieldDateTextControllerValidator;
  // State field(s) for TextFieldTime widget.
  FocusNode? textFieldTimeFocusNode;
  TextEditingController? textFieldTimeTextController;
  String? Function(BuildContext, String?)? textFieldTimeTextControllerValidator;
  // State field(s) for DropDowntype widget.
  String? dropDowntypeValue;
  FormFieldController<String>? dropDowntypeValueController;
  // State field(s) for DropDownMin widget.
  String? dropDownMinValue;
  FormFieldController<String>? dropDownMinValueController;
  // State field(s) for DropDownSec widget.
  String? dropDownSecValue;
  FormFieldController<String>? dropDownSecValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  LeadCallLogsRecord? callRes1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldDateFocusNode?.dispose();
    textFieldDateTextController?.dispose();

    textFieldTimeFocusNode?.dispose();
    textFieldTimeTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();
  }
}
