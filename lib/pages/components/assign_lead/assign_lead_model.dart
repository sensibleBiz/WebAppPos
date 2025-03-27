import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'assign_lead_widget.dart' show AssignLeadWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AssignLeadModel extends FlutterFlowModel<AssignLeadWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for dealerSwitch widget.
  bool? dealerSwitchValue;
  // State field(s) for executiveAssigneDropDown widget.
  String? executiveAssigneDropDownValue;
  FormFieldController<String>? executiveAssigneDropDownValueController;
  // State field(s) for assigneDealerDropDown widget.
  String? assigneDealerDropDownValue;
  FormFieldController<String>? assigneDealerDropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UserProfileRecord? userRef1;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  LeadsManagementRecord? res1Copy;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UserProfileRecord? userRef2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  LeadsManagementRecord? res2;
  // Stores action output result for [Custom Action - leadDocRefCopy] action in Button widget.
  List<dynamic>? res3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
