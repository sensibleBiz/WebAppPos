import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'c_add_premises_widget.dart' show CAddPremisesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CAddPremisesModel extends FlutterFlowModel<CAddPremisesWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldPremisesName widget.
  FocusNode? textFieldPremisesNameFocusNode;
  TextEditingController? textFieldPremisesNameController;
  String? Function(BuildContext, String?)?
      textFieldPremisesNameControllerValidator;
  String? _textFieldPremisesNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[a-zA-Z]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextFieldCode widget.
  FocusNode? textFieldCodeFocusNode;
  TextEditingController? textFieldCodeController;
  String? Function(BuildContext, String?)? textFieldCodeControllerValidator;
  // State field(s) for DropDownPremisesType widget.
  String? dropDownPremisesTypeValue;
  FormFieldController<String>? dropDownPremisesTypeValueController;
  // State field(s) for TextFieldNoOfTable widget.
  FocusNode? textFieldNoOfTableFocusNode;
  TextEditingController? textFieldNoOfTableController;
  String? Function(BuildContext, String?)?
      textFieldNoOfTableControllerValidator;
  String? _textFieldNoOfTableControllerValidator(
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

  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  PremisesRecord? catDoc;

  @override
  void initState(BuildContext context) {
    textFieldPremisesNameControllerValidator =
        _textFieldPremisesNameControllerValidator;
    textFieldNoOfTableControllerValidator =
        _textFieldNoOfTableControllerValidator;
    textFieldRangStartWithControllerValidator =
        _textFieldRangStartWithControllerValidator;
  }

  @override
  void dispose() {
    textFieldPremisesNameFocusNode?.dispose();
    textFieldPremisesNameController?.dispose();

    textFieldCodeFocusNode?.dispose();
    textFieldCodeController?.dispose();

    textFieldNoOfTableFocusNode?.dispose();
    textFieldNoOfTableController?.dispose();

    textFieldRangStartWithFocusNode?.dispose();
    textFieldRangStartWithController?.dispose();
  }
}
