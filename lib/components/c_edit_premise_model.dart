import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'c_edit_premise_widget.dart' show CEditPremiseWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CEditPremiseModel extends FlutterFlowModel<CEditPremiseWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldPremiseName widget.
  FocusNode? textFieldPremiseNameFocusNode;
  TextEditingController? textFieldPremiseNameController;
  String? Function(BuildContext, String?)?
      textFieldPremiseNameControllerValidator;
  String? _textFieldPremiseNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[a-zA-Z]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[0-9]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for DropDownPremisesType widget.
  String? dropDownPremisesTypeValue;
  FormFieldController<String>? dropDownPremisesTypeValueController;
  // State field(s) for TextFieldNoOfTables widget.
  FocusNode? textFieldNoOfTablesFocusNode;
  TextEditingController? textFieldNoOfTablesController;
  String? Function(BuildContext, String?)?
      textFieldNoOfTablesControllerValidator;
  String? _textFieldNoOfTablesControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[0-9]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextFieldRangStartWith widget.
  FocusNode? textFieldRangStartWithFocusNode;
  TextEditingController? textFieldRangStartWithController;
  String? Function(BuildContext, String?)?
      textFieldRangStartWithControllerValidator;
  String? _textFieldRangStartWithControllerValidator(
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
    textFieldPremiseNameControllerValidator =
        _textFieldPremiseNameControllerValidator;
    textController2Validator = _textController2Validator;
    textFieldNoOfTablesControllerValidator =
        _textFieldNoOfTablesControllerValidator;
    textFieldRangStartWithControllerValidator =
        _textFieldRangStartWithControllerValidator;
  }

  @override
  void dispose() {
    textFieldPremiseNameFocusNode?.dispose();
    textFieldPremiseNameController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();

    textFieldNoOfTablesFocusNode?.dispose();
    textFieldNoOfTablesController?.dispose();

    textFieldRangStartWithFocusNode?.dispose();
    textFieldRangStartWithController?.dispose();
  }
}
