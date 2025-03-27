import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'add_zone_widget.dart' show AddZoneWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddZoneModel extends FlutterFlowModel<AddZoneWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextLanguageName widget.
  FocusNode? textLanguageNameFocusNode;
  TextEditingController? textLanguageNameTextController;
  String? Function(BuildContext, String?)?
      textLanguageNameTextControllerValidator;
  String? _textLanguageNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[a-zA-Z]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    textLanguageNameTextControllerValidator =
        _textLanguageNameTextControllerValidator;
  }

  @override
  void dispose() {
    textLanguageNameFocusNode?.dispose();
    textLanguageNameTextController?.dispose();
  }
}
