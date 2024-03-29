import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'update_tax_widget.dart' show UpdateTaxWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class UpdateTaxModel extends FlutterFlowModel<UpdateTaxWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextTaxName widget.
  FocusNode? textTaxNameFocusNode;
  TextEditingController? textTaxNameController;
  String? Function(BuildContext, String?)? textTaxNameControllerValidator;
  String? _textTaxNameControllerValidator(BuildContext context, String? val) {
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
  TextEditingController? textTaxPercentageNumberController;
  String? Function(BuildContext, String?)?
      textTaxPercentageNumberControllerValidator;
  String? _textTaxPercentageNumberControllerValidator(
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
  TextEditingController? textTaxTypeCodeController;
  String? Function(BuildContext, String?)? textTaxTypeCodeControllerValidator;
  String? _textTaxTypeCodeControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[0-9]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    textTaxNameControllerValidator = _textTaxNameControllerValidator;
    textTaxPercentageNumberControllerValidator =
        _textTaxPercentageNumberControllerValidator;
    textTaxTypeCodeControllerValidator = _textTaxTypeCodeControllerValidator;
  }

  @override
  void dispose() {
    textTaxNameFocusNode?.dispose();
    textTaxNameController?.dispose();

    textTaxPercentageNumberFocusNode?.dispose();
    textTaxPercentageNumberController?.dispose();

    textTaxTypeCodeFocusNode?.dispose();
    textTaxTypeCodeController?.dispose();
  }
}
