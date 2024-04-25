import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_follow_up_widget.dart' show AddFollowUpWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddFollowUpModel extends FlutterFlowModel<AddFollowUpWidget> {
  ///  State fields for stateful widgets in this component.

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for TextFieldfollowUpName widget.
  FocusNode? textFieldfollowUpNameFocusNode;
  TextEditingController? textFieldfollowUpNameTextController;
  String? Function(BuildContext, String?)?
      textFieldfollowUpNameTextControllerValidator;
  // State field(s) for DropDownLeadPriority widget.
  String? dropDownLeadPriorityValue;
  FormFieldController<String>? dropDownLeadPriorityValueController;
  // State field(s) for DropDownAssgTo widget.
  String? dropDownAssgToValue;
  FormFieldController<String>? dropDownAssgToValueController;
  // State field(s) for TextFieldDiscription widget.
  FocusNode? textFieldDiscriptionFocusNode;
  TextEditingController? textFieldDiscriptionTextController;
  String? Function(BuildContext, String?)?
      textFieldDiscriptionTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  LeadFollowUpRecord? doc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldfollowUpNameFocusNode?.dispose();
    textFieldfollowUpNameTextController?.dispose();

    textFieldDiscriptionFocusNode?.dispose();
    textFieldDiscriptionTextController?.dispose();
  }
}
