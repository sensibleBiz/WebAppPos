import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'update_subscription_widget.dart' show UpdateSubscriptionWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class UpdateSubscriptionModel
    extends FlutterFlowModel<UpdateSubscriptionWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextPlanName widget.
  FocusNode? textPlanNameFocusNode;
  TextEditingController? textPlanNameTextController;
  String? Function(BuildContext, String?)? textPlanNameTextControllerValidator;
  String? _textPlanNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[a-zA-Z]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextDiscription widget.
  FocusNode? textDiscriptionFocusNode;
  TextEditingController? textDiscriptionTextController;
  String? Function(BuildContext, String?)?
      textDiscriptionTextControllerValidator;
  String? _textDiscriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[A-Za-z]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextSubscriptionTypeCode widget.
  FocusNode? textSubscriptionTypeCodeFocusNode;
  TextEditingController? textSubscriptionTypeCodeTextController;
  String? Function(BuildContext, String?)?
      textSubscriptionTypeCodeTextControllerValidator;
  String? _textSubscriptionTypeCodeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[0-9]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextValidity widget.
  FocusNode? textValidityFocusNode;
  TextEditingController? textValidityTextController;
  String? Function(BuildContext, String?)? textValidityTextControllerValidator;
  String? _textValidityTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[0-9]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextSubscriptionAmount widget.
  FocusNode? textSubscriptionAmountFocusNode;
  TextEditingController? textSubscriptionAmountTextController;
  String? Function(BuildContext, String?)?
      textSubscriptionAmountTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextUpiLink widget.
  FocusNode? textUpiLinkFocusNode;
  TextEditingController? textUpiLinkTextController;
  String? Function(BuildContext, String?)? textUpiLinkTextControllerValidator;
  String? _textUpiLinkTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    textPlanNameTextControllerValidator = _textPlanNameTextControllerValidator;
    textDiscriptionTextControllerValidator =
        _textDiscriptionTextControllerValidator;
    textSubscriptionTypeCodeTextControllerValidator =
        _textSubscriptionTypeCodeTextControllerValidator;
    textValidityTextControllerValidator = _textValidityTextControllerValidator;
    textUpiLinkTextControllerValidator = _textUpiLinkTextControllerValidator;
  }

  @override
  void dispose() {
    textPlanNameFocusNode?.dispose();
    textPlanNameTextController?.dispose();

    textDiscriptionFocusNode?.dispose();
    textDiscriptionTextController?.dispose();

    textSubscriptionTypeCodeFocusNode?.dispose();
    textSubscriptionTypeCodeTextController?.dispose();

    textValidityFocusNode?.dispose();
    textValidityTextController?.dispose();

    textSubscriptionAmountFocusNode?.dispose();
    textSubscriptionAmountTextController?.dispose();

    textUpiLinkFocusNode?.dispose();
    textUpiLinkTextController?.dispose();
  }
}
