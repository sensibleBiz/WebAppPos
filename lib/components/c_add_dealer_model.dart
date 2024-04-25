import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'c_add_dealer_widget.dart' show CAddDealerWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CAddDealerModel extends FlutterFlowModel<CAddDealerWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for SearchMobileTextField widget.
  FocusNode? searchMobileTextFieldFocusNode;
  TextEditingController? searchMobileTextFieldTextController;
  String? Function(BuildContext, String?)?
      searchMobileTextFieldTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UserProfileRecord? checkUser;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  DealersRecord? checkDuplicate;
  // State field(s) for TextFieldMobile widget.
  FocusNode? textFieldMobileFocusNode1;
  TextEditingController? textFieldMobileTextController1;
  String? Function(BuildContext, String?)?
      textFieldMobileTextController1Validator;
  // State field(s) for TextFieldMobile widget.
  FocusNode? textFieldMobileFocusNode2;
  TextEditingController? textFieldMobileTextController2;
  String? Function(BuildContext, String?)?
      textFieldMobileTextController2Validator;
  // State field(s) for TextFieldEmailId widget.
  FocusNode? textFieldEmailIdFocusNode;
  TextEditingController? textFieldEmailIdTextController;
  String? Function(BuildContext, String?)?
      textFieldEmailIdTextControllerValidator;
  // State field(s) for companyName widget.
  FocusNode? companyNameFocusNode;
  TextEditingController? companyNameTextController;
  String? Function(BuildContext, String?)? companyNameTextControllerValidator;
  String? _companyNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for gstNumber widget.
  FocusNode? gstNumberFocusNode;
  TextEditingController? gstNumberTextController;
  String? Function(BuildContext, String?)? gstNumberTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  DealersRecord? fetchedDuplicateDealer;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  DealersRecord? createDealer;

  @override
  void initState(BuildContext context) {
    companyNameTextControllerValidator = _companyNameTextControllerValidator;
  }

  @override
  void dispose() {
    searchMobileTextFieldFocusNode?.dispose();
    searchMobileTextFieldTextController?.dispose();

    textFieldMobileFocusNode1?.dispose();
    textFieldMobileTextController1?.dispose();

    textFieldMobileFocusNode2?.dispose();
    textFieldMobileTextController2?.dispose();

    textFieldEmailIdFocusNode?.dispose();
    textFieldEmailIdTextController?.dispose();

    companyNameFocusNode?.dispose();
    companyNameTextController?.dispose();

    gstNumberFocusNode?.dispose();
    gstNumberTextController?.dispose();
  }
}
