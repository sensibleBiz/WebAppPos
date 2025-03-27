import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/category_pop_up/category_pop_up_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'c_add_category_widget.dart' show CAddCategoryWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CAddCategoryModel extends FlutterFlowModel<CAddCategoryWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldName widget.
  FocusNode? textFieldNameFocusNode;
  TextEditingController? textFieldNameTextController;
  String? Function(BuildContext, String?)? textFieldNameTextControllerValidator;
  String? _textFieldNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[a-z]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for categoryNo widget.
  FocusNode? categoryNoFocusNode;
  TextEditingController? categoryNoTextController;
  String? Function(BuildContext, String?)? categoryNoTextControllerValidator;
  String? _categoryNoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[0-9]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // Stores action output result for [Custom Action - checkDupCategory] action in Container widget.
  bool? dupRef;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  CategoryRecord? catDoc;

  @override
  void initState(BuildContext context) {
    textFieldNameTextControllerValidator =
        _textFieldNameTextControllerValidator;
    categoryNoTextControllerValidator = _categoryNoTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldNameFocusNode?.dispose();
    textFieldNameTextController?.dispose();

    categoryNoFocusNode?.dispose();
    categoryNoTextController?.dispose();
  }
}
