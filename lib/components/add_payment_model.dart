import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_payment_widget.dart' show AddPaymentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddPaymentModel extends FlutterFlowModel<AddPaymentWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextPaymentName widget.
  FocusNode? textPaymentNameFocusNode;
  TextEditingController? textPaymentNameController;
  String? Function(BuildContext, String?)? textPaymentNameControllerValidator;
  String? _textPaymentNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[A-Z]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextPaymentCode widget.
  FocusNode? textPaymentCodeFocusNode;
  TextEditingController? textPaymentCodeController;
  String? Function(BuildContext, String?)? textPaymentCodeControllerValidator;
  String? _textPaymentCodeControllerValidator(
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
  PaymentModeRecord? doc;

  @override
  void initState(BuildContext context) {
    textPaymentNameControllerValidator = _textPaymentNameControllerValidator;
    textPaymentCodeControllerValidator = _textPaymentCodeControllerValidator;
  }

  @override
  void dispose() {
    textPaymentNameFocusNode?.dispose();
    textPaymentNameController?.dispose();

    textPaymentCodeFocusNode?.dispose();
    textPaymentCodeController?.dispose();
  }
}
