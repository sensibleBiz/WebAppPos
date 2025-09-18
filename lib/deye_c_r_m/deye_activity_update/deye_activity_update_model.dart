import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'deye_activity_update_widget.dart' show DeyeActivityUpdateWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DeyeActivityUpdateModel
    extends FlutterFlowModel<DeyeActivityUpdateWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldCustomerName widget.
  FocusNode? textFieldCustomerNameFocusNode;
  TextEditingController? textFieldCustomerNameTextController;
  String? Function(BuildContext, String?)?
      textFieldCustomerNameTextControllerValidator;
  // State field(s) for actionDropdown widget.
  String? actionDropdownValue;
  FormFieldController<String>? actionDropdownValueController;
  // State field(s) for typeDropdown widget.
  String? typeDropdownValue;
  FormFieldController<String>? typeDropdownValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  LeadActivitiesRecord? activityDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldCustomerNameFocusNode?.dispose();
    textFieldCustomerNameTextController?.dispose();
  }
}
