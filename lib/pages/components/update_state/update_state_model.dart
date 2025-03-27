import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'update_state_widget.dart' show UpdateStateWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class UpdateStateModel extends FlutterFlowModel<UpdateStateWidget> {
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

  // State field(s) for TextLanguageCode widget.
  FocusNode? textLanguageCodeFocusNode;
  TextEditingController? textLanguageCodeTextController;
  String? Function(BuildContext, String?)?
      textLanguageCodeTextControllerValidator;
  String? _textLanguageCodeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[0-9]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {
    textLanguageNameTextControllerValidator =
        _textLanguageNameTextControllerValidator;
    textLanguageCodeTextControllerValidator =
        _textLanguageCodeTextControllerValidator;
  }

  @override
  void dispose() {
    textLanguageNameFocusNode?.dispose();
    textLanguageNameTextController?.dispose();

    textLanguageCodeFocusNode?.dispose();
    textLanguageCodeTextController?.dispose();
  }
}
