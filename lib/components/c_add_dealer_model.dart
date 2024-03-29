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
  TextEditingController? searchMobileTextFieldController;
  String? Function(BuildContext, String?)?
      searchMobileTextFieldControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UserProfileRecord? checkUser;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  DealersRecord? checkDuplicate;
  // State field(s) for TextFieldMobile widget.
  FocusNode? textFieldMobileFocusNode1;
  TextEditingController? textFieldMobileController1;
  String? Function(BuildContext, String?)? textFieldMobileController1Validator;
  // State field(s) for TextFieldMobile widget.
  FocusNode? textFieldMobileFocusNode2;
  TextEditingController? textFieldMobileController2;
  String? Function(BuildContext, String?)? textFieldMobileController2Validator;
  // State field(s) for TextFieldEmailId widget.
  FocusNode? textFieldEmailIdFocusNode;
  TextEditingController? textFieldEmailIdController;
  String? Function(BuildContext, String?)? textFieldEmailIdControllerValidator;
  // State field(s) for companyName widget.
  FocusNode? companyNameFocusNode;
  TextEditingController? companyNameController;
  String? Function(BuildContext, String?)? companyNameControllerValidator;
  String? _companyNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for gstNumber widget.
  FocusNode? gstNumberFocusNode;
  TextEditingController? gstNumberController;
  String? Function(BuildContext, String?)? gstNumberControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  DealersRecord? fetchedDuplicateDealer;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  DealersRecord? createDealer;

  @override
  void initState(BuildContext context) {
    companyNameControllerValidator = _companyNameControllerValidator;
  }

  @override
  void dispose() {
    searchMobileTextFieldFocusNode?.dispose();
    searchMobileTextFieldController?.dispose();

    textFieldMobileFocusNode1?.dispose();
    textFieldMobileController1?.dispose();

    textFieldMobileFocusNode2?.dispose();
    textFieldMobileController2?.dispose();

    textFieldEmailIdFocusNode?.dispose();
    textFieldEmailIdController?.dispose();

    companyNameFocusNode?.dispose();
    companyNameController?.dispose();

    gstNumberFocusNode?.dispose();
    gstNumberController?.dispose();
  }
}
