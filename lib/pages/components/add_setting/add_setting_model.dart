import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'add_setting_widget.dart' show AddSettingWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddSettingModel extends FlutterFlowModel<AddSettingWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  String? _titleTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[a-zA-Z]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for Display widget.
  FocusNode? displayFocusNode;
  TextEditingController? displayTextController;
  String? Function(BuildContext, String?)? displayTextControllerValidator;
  // State field(s) for TextTaxTypeCode widget.
  FocusNode? textTaxTypeCodeFocusNode;
  TextEditingController? textTaxTypeCodeTextController;
  String? Function(BuildContext, String?)?
      textTaxTypeCodeTextControllerValidator;
  String? _textTaxTypeCodeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[0-9]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextTaxTypeCode widget.
  String? textTaxTypeCodeValue;
  FormFieldController<String>? textTaxTypeCodeValueController;
  // Stores action output result for [Custom Action - toTitleCase] action in Container widget.
  String? display;
  // Stores action output result for [Custom Action - toCamelCase] action in Container widget.
  String? title;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  AppSettingsMasterRecord? docExists;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  AppSettingsMasterRecord? doc;

  @override
  void initState(BuildContext context) {
    titleTextControllerValidator = _titleTextControllerValidator;
    textTaxTypeCodeTextControllerValidator =
        _textTaxTypeCodeTextControllerValidator;
  }

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    displayFocusNode?.dispose();
    displayTextController?.dispose();

    textTaxTypeCodeFocusNode?.dispose();
    textTaxTypeCodeTextController?.dispose();
  }
}
