import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
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
  ///  Local state fields for this component.

  dynamic record;

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
  // Stores action output result for [Custom Action - userAsDealerExists] action in Button widget.
  bool? res;
  // State field(s) for TextFieldName widget.
  FocusNode? textFieldNameFocusNode;
  TextEditingController? textFieldNameTextController;
  String? Function(BuildContext, String?)? textFieldNameTextControllerValidator;
  // State field(s) for TextFieldMobile widget.
  FocusNode? textFieldMobileFocusNode;
  TextEditingController? textFieldMobileTextController;
  String? Function(BuildContext, String?)?
      textFieldMobileTextControllerValidator;
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

  // State field(s) for TextFieldDeals widget.
  FocusNode? textFieldDealsFocusNode;
  TextEditingController? textFieldDealsTextController;
  String? Function(BuildContext, String?)?
      textFieldDealsTextControllerValidator;
  // State field(s) for gstNumber widget.
  FocusNode? gstNumberFocusNode;
  TextEditingController? gstNumberTextController;
  String? Function(BuildContext, String?)? gstNumberTextControllerValidator;
  // State field(s) for remark widget.
  FocusNode? remarkFocusNode1;
  TextEditingController? remarkTextController1;
  String? Function(BuildContext, String?)? remarkTextController1Validator;
  // State field(s) for DropDownState widget.
  String? dropDownStateValue;
  FormFieldController<String>? dropDownStateValueController;
  // State field(s) for DropDownCity widget.
  String? dropDownCityValue;
  FormFieldController<String>? dropDownCityValueController;
  // State field(s) for remark widget.
  FocusNode? remarkFocusNode2;
  TextEditingController? remarkTextController2;
  String? Function(BuildContext, String?)? remarkTextController2Validator;
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

    textFieldNameFocusNode?.dispose();
    textFieldNameTextController?.dispose();

    textFieldMobileFocusNode?.dispose();
    textFieldMobileTextController?.dispose();

    textFieldEmailIdFocusNode?.dispose();
    textFieldEmailIdTextController?.dispose();

    companyNameFocusNode?.dispose();
    companyNameTextController?.dispose();

    textFieldDealsFocusNode?.dispose();
    textFieldDealsTextController?.dispose();

    gstNumberFocusNode?.dispose();
    gstNumberTextController?.dispose();

    remarkFocusNode1?.dispose();
    remarkTextController1?.dispose();

    remarkFocusNode2?.dispose();
    remarkTextController2?.dispose();
  }
}
