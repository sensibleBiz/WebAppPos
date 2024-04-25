import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'update_unit_type_widget.dart' show UpdateUnitTypeWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class UpdateUnitTypeModel extends FlutterFlowModel<UpdateUnitTypeWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextUnitName widget.
  FocusNode? textUnitNameFocusNode;
  TextEditingController? textUnitNameTextController;
  String? Function(BuildContext, String?)? textUnitNameTextControllerValidator;
  String? _textUnitNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[A-Z]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextUnitTypeName widget.
  FocusNode? textUnitTypeNameFocusNode;
  TextEditingController? textUnitTypeNameTextController;
  String? Function(BuildContext, String?)?
      textUnitTypeNameTextControllerValidator;
  String? _textUnitTypeNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextFactorName widget.
  FocusNode? textFactorNameFocusNode;
  TextEditingController? textFactorNameTextController;
  String? Function(BuildContext, String?)?
      textFactorNameTextControllerValidator;
  String? _textFactorNameTextControllerValidator(
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
  TextEditingController? textUnitTypeCodeTextController;
  String? Function(BuildContext, String?)?
      textUnitTypeCodeTextControllerValidator;
  String? _textUnitTypeCodeTextControllerValidator(
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
    textUnitNameTextControllerValidator = _textUnitNameTextControllerValidator;
    textUnitTypeNameTextControllerValidator =
        _textUnitTypeNameTextControllerValidator;
    textFactorNameTextControllerValidator =
        _textFactorNameTextControllerValidator;
    textUnitTypeCodeTextControllerValidator =
        _textUnitTypeCodeTextControllerValidator;
  }

  @override
  void dispose() {
    textUnitNameFocusNode?.dispose();
    textUnitNameTextController?.dispose();

    textUnitTypeNameFocusNode?.dispose();
    textUnitTypeNameTextController?.dispose();

    textFactorNameFocusNode?.dispose();
    textFactorNameTextController?.dispose();

    textUnitTypeCodeFocusNode?.dispose();
    textUnitTypeCodeTextController?.dispose();
  }
}
