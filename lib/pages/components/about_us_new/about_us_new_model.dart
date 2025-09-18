import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'about_us_new_widget.dart' show AboutUsNewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AboutUsNewModel extends FlutterFlowModel<AboutUsNewWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldDetails widget.
  FocusNode? textFieldDetailsFocusNode;
  TextEditingController? textFieldDetailsTextController;
  String? Function(BuildContext, String?)?
      textFieldDetailsTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldDetailsFocusNode?.dispose();
    textFieldDetailsTextController?.dispose();
  }
}
