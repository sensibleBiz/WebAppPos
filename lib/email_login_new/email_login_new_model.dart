import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'email_login_new_widget.dart' show EmailLoginNewWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EmailLoginNewModel extends FlutterFlowModel<EmailLoginNewWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextFieldEmail widget.
  FocusNode? textFieldEmailFocusNode;
  TextEditingController? textFieldEmailController;
  String? Function(BuildContext, String?)? textFieldEmailControllerValidator;
  // State field(s) for TextFieldPwd widget.
  FocusNode? textFieldPwdFocusNode;
  TextEditingController? textFieldPwdController;
  late bool textFieldPwdVisibility;
  String? Function(BuildContext, String?)? textFieldPwdControllerValidator;
  // Stores action output result for [Custom Action - validUser] action in Container widget.
  bool? isProfile;
  // Stores action output result for [Custom Action - isUserPin] action in Container widget.
  bool? userPass;
  // Stores action output result for [Custom Action - isUser] action in Container widget.
  bool? isUser;
  // Stores action output result for [Custom Action - isAdmin] action in Container widget.
  bool? isAdmin;
  // Stores action output result for [Custom Action - newCustomAction] action in Container widget.
  DocumentReference? ref;

  @override
  void initState(BuildContext context) {
    textFieldPwdVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldEmailFocusNode?.dispose();
    textFieldEmailController?.dispose();

    textFieldPwdFocusNode?.dispose();
    textFieldPwdController?.dispose();
  }
}
