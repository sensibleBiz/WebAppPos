import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_unit_type_widget.dart' show AddUnitTypeWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddUnitTypeModel extends FlutterFlowModel<AddUnitTypeWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextUnitName widget.
  FocusNode? textUnitNameFocusNode;
  TextEditingController? textUnitNameController;
  String? Function(BuildContext, String?)? textUnitNameControllerValidator;
  String? _textUnitNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[a-zA-Z]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextUnitTypeName widget.
  FocusNode? textUnitTypeNameFocusNode;
  TextEditingController? textUnitTypeNameController;
  String? Function(BuildContext, String?)? textUnitTypeNameControllerValidator;
  String? _textUnitTypeNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextFactorName widget.
  FocusNode? textFactorNameFocusNode;
  TextEditingController? textFactorNameController;
  String? Function(BuildContext, String?)? textFactorNameControllerValidator;
  String? _textFactorNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[0-9]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextUnitTypeCode widget.
  FocusNode? textUnitTypeCodeFocusNode;
  TextEditingController? textUnitTypeCodeController;
  String? Function(BuildContext, String?)? textUnitTypeCodeControllerValidator;
  String? _textUnitTypeCodeControllerValidator(
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
  UnitTypeRecord? doc;

  @override
  void initState(BuildContext context) {
    textUnitNameControllerValidator = _textUnitNameControllerValidator;
    textUnitTypeNameControllerValidator = _textUnitTypeNameControllerValidator;
    textFactorNameControllerValidator = _textFactorNameControllerValidator;
    textUnitTypeCodeControllerValidator = _textUnitTypeCodeControllerValidator;
  }

  @override
  void dispose() {
    textUnitNameFocusNode?.dispose();
    textUnitNameController?.dispose();

    textUnitTypeNameFocusNode?.dispose();
    textUnitTypeNameController?.dispose();

    textFactorNameFocusNode?.dispose();
    textFactorNameController?.dispose();

    textUnitTypeCodeFocusNode?.dispose();
    textUnitTypeCodeController?.dispose();
  }
}
