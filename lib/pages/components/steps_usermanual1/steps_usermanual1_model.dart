import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'steps_usermanual1_widget.dart' show StepsUsermanual1Widget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class StepsUsermanual1Model extends FlutterFlowModel<StepsUsermanual1Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldImageUrl widget.
  FocusNode? textFieldImageUrlFocusNode;
  TextEditingController? textFieldImageUrlTextController;
  String? Function(BuildContext, String?)?
      textFieldImageUrlTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldImageUrlFocusNode?.dispose();
    textFieldImageUrlTextController?.dispose();
  }
}
