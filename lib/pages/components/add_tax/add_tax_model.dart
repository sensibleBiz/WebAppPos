import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'add_tax_widget.dart' show AddTaxWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddTaxModel extends FlutterFlowModel<AddTaxWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextTaxTypeName widget.
  FocusNode? textTaxTypeNameFocusNode;
  TextEditingController? textTaxTypeNameTextController;
  String? Function(BuildContext, String?)?
      textTaxTypeNameTextControllerValidator;
  String? _textTaxTypeNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[a-zA-Z]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextTaxPercentageNumber widget.
  FocusNode? textTaxPercentageNumberFocusNode;
  TextEditingController? textTaxPercentageNumberTextController;
  String? Function(BuildContext, String?)?
      textTaxPercentageNumberTextControllerValidator;
  String? _textTaxPercentageNumberTextControllerValidator(
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

  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  TaxMasterRecord? doc;

  @override
  void initState(BuildContext context) {
    textTaxTypeNameTextControllerValidator =
        _textTaxTypeNameTextControllerValidator;
    textTaxPercentageNumberTextControllerValidator =
        _textTaxPercentageNumberTextControllerValidator;
    textTaxTypeCodeTextControllerValidator =
        _textTaxTypeCodeTextControllerValidator;
  }

  @override
  void dispose() {
    textTaxTypeNameFocusNode?.dispose();
    textTaxTypeNameTextController?.dispose();

    textTaxPercentageNumberFocusNode?.dispose();
    textTaxPercentageNumberTextController?.dispose();

    textTaxTypeCodeFocusNode?.dispose();
    textTaxTypeCodeTextController?.dispose();
  }
}
