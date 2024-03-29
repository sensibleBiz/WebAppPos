import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'c_o_t_pverification_widget.dart' show COTPverificationWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class COTPverificationModel extends FlutterFlowModel<COTPverificationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextFieldMobileNumber widget.
  FocusNode? textFieldMobileNumberFocusNode;
  TextEditingController? textFieldMobileNumberController;
  String? Function(BuildContext, String?)?
      textFieldMobileNumberControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldMobileNumberFocusNode?.dispose();
    textFieldMobileNumberController?.dispose();
  }
}
