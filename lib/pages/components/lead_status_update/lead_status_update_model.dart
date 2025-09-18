import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'lead_status_update_widget.dart' show LeadStatusUpdateWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LeadStatusUpdateModel extends FlutterFlowModel<LeadStatusUpdateWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextTaxName widget.
  FocusNode? textTaxNameFocusNode;
  TextEditingController? textTaxNameTextController;
  String? Function(BuildContext, String?)? textTaxNameTextControllerValidator;
  String? _textTaxNameTextControllerValidator(
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

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  LeadStagesRecord? docStage;

  @override
  void initState(BuildContext context) {
    textTaxNameTextControllerValidator = _textTaxNameTextControllerValidator;
    textTaxTypeCodeTextControllerValidator =
        _textTaxTypeCodeTextControllerValidator;
  }

  @override
  void dispose() {
    textTaxNameFocusNode?.dispose();
    textTaxNameTextController?.dispose();

    textTaxPercentageNumberFocusNode?.dispose();
    textTaxPercentageNumberTextController?.dispose();

    textTaxTypeCodeFocusNode?.dispose();
    textTaxTypeCodeTextController?.dispose();
  }
}
