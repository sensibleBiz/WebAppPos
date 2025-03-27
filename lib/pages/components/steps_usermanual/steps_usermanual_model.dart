import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'steps_usermanual_widget.dart' show StepsUsermanualWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StepsUsermanualModel extends FlutterFlowModel<StepsUsermanualWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldEdit widget.
  FocusNode? textFieldEditFocusNode;
  TextEditingController? textFieldEditTextController;
  String? Function(BuildContext, String?)? textFieldEditTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldEditFocusNode?.dispose();
    textFieldEditTextController?.dispose();
  }
}
