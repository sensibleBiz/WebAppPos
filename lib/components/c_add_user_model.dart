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
  TextEditingController? textFieldNameController;
  String? Function(BuildContext, String?)? textFieldNameControllerValidator;
  String? _textFieldNameControllerValidator(BuildContext context, String? val) {
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
  TextEditingController? textFieldMobileController;
  String? Function(BuildContext, String?)? textFieldMobileControllerValidator;
  String? _textFieldMobileControllerValidator(
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
  TextEditingController? textFieldEmailIdController;
  String? Function(BuildContext, String?)? textFieldEmailIdControllerValidator;
  String? _textFieldEmailIdControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextFieldPassword widget.
  FocusNode? textFieldPasswordFocusNode;
  TextEditingController? textFieldPasswordController;
  late bool textFieldPasswordVisibility;
  String? Function(BuildContext, String?)? textFieldPasswordControllerValidator;
  // State field(s) for TextFieldQuickPin widget.
  FocusNode? textFieldQuickPinFocusNode;
  TextEditingController? textFieldQuickPinController;
  String? Function(BuildContext, String?)? textFieldQuickPinControllerValidator;
  // State field(s) for TextFieldCode widget.
  FocusNode? textFieldCodeFocusNode;
  TextEditingController? textFieldCodeController;
  String? Function(BuildContext, String?)? textFieldCodeControllerValidator;
  // State field(s) for CheckboxGroup1 widget.
  List<String>? checkboxGroup1Values;
  FormFieldController<List<String>>? checkboxGroup1ValueController;
  // State field(s) for CheckboxGroup2 widget.
  List<String>? checkboxGroup2Values;
  FormFieldController<List<String>>? checkboxGroup2ValueController;

  @override
  void initState(BuildContext context) {
    textFieldNameControllerValidator = _textFieldNameControllerValidator;
    textFieldMobileControllerValidator = _textFieldMobileControllerValidator;
    textFieldEmailIdControllerValidator = _textFieldEmailIdControllerValidator;
    textFieldPasswordVisibility = false;
  }

  @override
  void dispose() {
    textFieldNameFocusNode?.dispose();
    textFieldNameController?.dispose();

    textFieldMobileFocusNode?.dispose();
    textFieldMobileController?.dispose();

    textFieldEmailIdFocusNode?.dispose();
    textFieldEmailIdController?.dispose();

    textFieldPasswordFocusNode?.dispose();
    textFieldPasswordController?.dispose();

    textFieldQuickPinFocusNode?.dispose();
    textFieldQuickPinController?.dispose();

    textFieldCodeFocusNode?.dispose();
    textFieldCodeController?.dispose();
  }
}
