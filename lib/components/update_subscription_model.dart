import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
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
  TextEditingController? textPlanNameController;
  String? Function(BuildContext, String?)? textPlanNameControllerValidator;
  String? _textPlanNameControllerValidator(BuildContext context, String? val) {
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

  // State field(s) for TextSubscriptionAmount widget.
  FocusNode? textSubscriptionAmountFocusNode;
  TextEditingController? textSubscriptionAmountController;
  String? Function(BuildContext, String?)?
      textSubscriptionAmountControllerValidator;
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

    return null;
  }

  @override
  void initState(BuildContext context) {
    textPlanNameControllerValidator = _textPlanNameControllerValidator;
    textDiscriptionControllerValidator = _textDiscriptionControllerValidator;
    textSubscriptionTypeCodeControllerValidator =
        _textSubscriptionTypeCodeControllerValidator;
    textValidityControllerValidator = _textValidityControllerValidator;
    textUpiLinkControllerValidator = _textUpiLinkControllerValidator;
  }

  @override
  void dispose() {
    textPlanNameFocusNode?.dispose();
    textPlanNameController?.dispose();

    textDiscriptionFocusNode?.dispose();
    textDiscriptionController?.dispose();

    textSubscriptionTypeCodeFocusNode?.dispose();
    textSubscriptionTypeCodeController?.dispose();

    textValidityFocusNode?.dispose();
    textValidityController?.dispose();

    textSubscriptionAmountFocusNode?.dispose();
    textSubscriptionAmountController?.dispose();

    textUpiLinkFocusNode?.dispose();
    textUpiLinkController?.dispose();
  }
}
