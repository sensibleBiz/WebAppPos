import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_subscription_widget.dart' show AddSubscriptionWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddSubscriptionModel extends FlutterFlowModel<AddSubscriptionWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextPlanTypeName widget.
  FocusNode? textPlanTypeNameFocusNode;
  TextEditingController? textPlanTypeNameController;
  String? Function(BuildContext, String?)? textPlanTypeNameControllerValidator;
  String? _textPlanTypeNameControllerValidator(
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
  TextEditingController? textDiscriptionController;
  String? Function(BuildContext, String?)? textDiscriptionControllerValidator;
  String? _textDiscriptionControllerValidator(
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
  TextEditingController? textSubscriptionTypeCodeController;
  String? Function(BuildContext, String?)?
      textSubscriptionTypeCodeControllerValidator;
  String? _textSubscriptionTypeCodeControllerValidator(
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
  TextEditingController? textValidityController;
  String? Function(BuildContext, String?)? textValidityControllerValidator;
  String? _textValidityControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[0-9]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextAmount widget.
  FocusNode? textAmountFocusNode;
  TextEditingController? textAmountController;
  String? Function(BuildContext, String?)? textAmountControllerValidator;
  String? _textAmountControllerValidator(BuildContext context, String? val) {
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
  // State field(s) for TextUpiLink widget.
  FocusNode? textUpiLinkFocusNode;
  TextEditingController? textUpiLinkController;
  String? Function(BuildContext, String?)? textUpiLinkControllerValidator;
  String? _textUpiLinkControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorWebsiteRegex).hasMatch(val)) {
      return 'Has to be a valid website.';
    }
    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  SubscriptionRecord? doc;

  @override
  void initState(BuildContext context) {
    textPlanTypeNameControllerValidator = _textPlanTypeNameControllerValidator;
    textDiscriptionControllerValidator = _textDiscriptionControllerValidator;
    textSubscriptionTypeCodeControllerValidator =
        _textSubscriptionTypeCodeControllerValidator;
    textValidityControllerValidator = _textValidityControllerValidator;
    textAmountControllerValidator = _textAmountControllerValidator;
    textUpiLinkControllerValidator = _textUpiLinkControllerValidator;
  }

  @override
  void dispose() {
    textPlanTypeNameFocusNode?.dispose();
    textPlanTypeNameController?.dispose();

    textDiscriptionFocusNode?.dispose();
    textDiscriptionController?.dispose();

    textSubscriptionTypeCodeFocusNode?.dispose();
    textSubscriptionTypeCodeController?.dispose();

    textValidityFocusNode?.dispose();
    textValidityController?.dispose();

    textAmountFocusNode?.dispose();
    textAmountController?.dispose();

    textUpiLinkFocusNode?.dispose();
    textUpiLinkController?.dispose();
  }
}
