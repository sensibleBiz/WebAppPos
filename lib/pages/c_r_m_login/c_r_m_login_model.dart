import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'c_r_m_login_widget.dart' show CRMLoginWidget;
import 'package:flip_card/flip_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CRMLoginModel extends FlutterFlowModel<CRMLoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextFieldEmail widget.
  FocusNode? textFieldEmailFocusNode;
  TextEditingController? textFieldEmailTextController;
  String? Function(BuildContext, String?)?
      textFieldEmailTextControllerValidator;
  // State field(s) for TextFieldPwd widget.
  FocusNode? textFieldPwdFocusNode;
  TextEditingController? textFieldPwdTextController;
  late bool textFieldPwdVisibility;
  String? Function(BuildContext, String?)? textFieldPwdTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UserProfileRecord? fetchedRecordUserProfile;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CitiesRecord>? cities;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<StateRecord>? states;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OutletRecord? outletDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CategoryRecord>? categoryDocs;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ProductRecord>? productDocs;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<TeamTreeRecord>? teamTree;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TeamTreeRecord? teamTREE;

  @override
  void initState(BuildContext context) {
    textFieldPwdVisibility = false;
  }

  @override
  void dispose() {
    textFieldEmailFocusNode?.dispose();
    textFieldEmailTextController?.dispose();

    textFieldPwdFocusNode?.dispose();
    textFieldPwdTextController?.dispose();
  }
}
