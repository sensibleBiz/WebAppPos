import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_lead_stage_widget.dart' show AddLeadStageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddLeadStageModel extends FlutterFlowModel<AddLeadStageWidget> {
  ///  Local state fields for this component.

  Color setColor = Color(4289865768);

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
  String? _displayTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[a-zA-Z]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

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

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  Color? colorPicked;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  LeadStagesRecord? docRef;

  @override
  void initState(BuildContext context) {
    titleTextControllerValidator = _titleTextControllerValidator;
    displayTextControllerValidator = _displayTextControllerValidator;
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
