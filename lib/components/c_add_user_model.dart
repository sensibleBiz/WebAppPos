import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'c_add_user_widget.dart' show CAddUserWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CAddUserModel extends FlutterFlowModel<CAddUserWidget> {
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

    if (!RegExp('[a-zA-Z]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextFieldMobile widget.
  FocusNode? textFieldMobileFocusNode;
  TextEditingController? textFieldMobileTextController;
  String? Function(BuildContext, String?)?
      textFieldMobileTextControllerValidator;
  String? _textFieldMobileTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[0-9]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextFieldEmailId widget.
  FocusNode? textFieldEmailIdFocusNode;
  TextEditingController? textFieldEmailIdTextController;
  String? Function(BuildContext, String?)?
      textFieldEmailIdTextControllerValidator;
  String? _textFieldEmailIdTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextFieldPassword widget.
  FocusNode? textFieldPasswordFocusNode;
  TextEditingController? textFieldPasswordTextController;
  late bool textFieldPasswordVisibility;
  String? Function(BuildContext, String?)?
      textFieldPasswordTextControllerValidator;
  // State field(s) for TextFieldQuickPin widget.
  FocusNode? textFieldQuickPinFocusNode;
  TextEditingController? textFieldQuickPinTextController;
  String? Function(BuildContext, String?)?
      textFieldQuickPinTextControllerValidator;
  // State field(s) for TextFieldCode widget.
  FocusNode? textFieldCodeFocusNode;
  TextEditingController? textFieldCodeTextController;
  String? Function(BuildContext, String?)? textFieldCodeTextControllerValidator;
  // State field(s) for CheckboxGroup1 widget.
  List<String>? checkboxGroup1Values;
  FormFieldController<List<String>>? checkboxGroup1ValueController;
  // State field(s) for CheckboxGroup2 widget.
  List<String>? checkboxGroup2Values;
  FormFieldController<List<String>>? checkboxGroup2ValueController;

  @override
  void initState(BuildContext context) {
    textFieldNameTextControllerValidator =
        _textFieldNameTextControllerValidator;
    textFieldMobileTextControllerValidator =
        _textFieldMobileTextControllerValidator;
    textFieldEmailIdTextControllerValidator =
        _textFieldEmailIdTextControllerValidator;
    textFieldPasswordVisibility = false;
  }

  @override
  void dispose() {
    textFieldNameFocusNode?.dispose();
    textFieldNameTextController?.dispose();

    textFieldMobileFocusNode?.dispose();
    textFieldMobileTextController?.dispose();

    textFieldEmailIdFocusNode?.dispose();
    textFieldEmailIdTextController?.dispose();

    textFieldPasswordFocusNode?.dispose();
    textFieldPasswordTextController?.dispose();

    textFieldQuickPinFocusNode?.dispose();
    textFieldQuickPinTextController?.dispose();

    textFieldCodeFocusNode?.dispose();
    textFieldCodeTextController?.dispose();
  }
}
