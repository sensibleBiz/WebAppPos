import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'email_login_not_in_use_widget.dart' show EmailLoginNotInUseWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EmailLoginNotInUseModel
    extends FlutterFlowModel<EmailLoginNotInUseWidget> {
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
  // State field(s) for TextFieldPwd1 widget.
  FocusNode? textFieldPwd1FocusNode;
  TextEditingController? textFieldPwd1TextController;
  String? Function(BuildContext, String?)? textFieldPwd1TextControllerValidator;
  // Stores action output result for [Custom Action - validUser] action in Container widget.
  bool? isProfile;

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

    textFieldPwd1FocusNode?.dispose();
    textFieldPwd1TextController?.dispose();
  }
}
