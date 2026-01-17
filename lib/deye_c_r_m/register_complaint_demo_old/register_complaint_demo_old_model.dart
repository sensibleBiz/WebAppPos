import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/popup_success_copy_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'register_complaint_demo_old_widget.dart'
    show RegisterComplaintDemoOldWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class RegisterComplaintDemoOldModel
    extends FlutterFlowModel<RegisterComplaintDemoOldWidget> {
  ///  Local state fields for this page.

  bool wait = true;

  bool isBtnDisabled = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for username widget.
  FocusNode? usernameFocusNode;
  TextEditingController? usernameTextController;
  String? Function(BuildContext, String?)? usernameTextControllerValidator;
  String? _usernameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for mobile widget.
  FocusNode? mobileFocusNode;
  TextEditingController? mobileTextController;
  String? Function(BuildContext, String?)? mobileTextControllerValidator;
  String? _mobileTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 10) {
      return 'Please enter a valid 10 digit mobile number.';
    }
    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for mobileAlt widget.
  FocusNode? mobileAltFocusNode;
  TextEditingController? mobileAltTextController;
  String? Function(BuildContext, String?)? mobileAltTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for DropDownstate widget.
  String? dropDownstateValue;
  FormFieldController<String>? dropDownstateValueController;
  // State field(s) for DropDownCities widget.
  String? dropDownCitiesValue;
  FormFieldController<String>? dropDownCitiesValueController;
  // State field(s) for area widget.
  FocusNode? areaFocusNode;
  TextEditingController? areaTextController;
  String? Function(BuildContext, String?)? areaTextControllerValidator;
  // State field(s) for Purchasefrom widget.
  FocusNode? purchasefromFocusNode;
  TextEditingController? purchasefromTextController;
  String? Function(BuildContext, String?)? purchasefromTextControllerValidator;
  // State field(s) for DropDownProductName widget.
  String? dropDownProductNameValue;
  FormFieldController<String>? dropDownProductNameValueController;
  // State field(s) for DropDownProductionCapacity widget.
  String? dropDownProductionCapacityValue;
  FormFieldController<String>? dropDownProductionCapacityValueController;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode1;
  TextEditingController? phoneTextController1;
  String? Function(BuildContext, String?)? phoneTextController1Validator;
  // State field(s) for SerialNumber widget.
  FocusNode? serialNumberFocusNode;
  TextEditingController? serialNumberTextController;
  String? Function(BuildContext, String?)? serialNumberTextControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode2;
  TextEditingController? phoneTextController2;
  String? Function(BuildContext, String?)? phoneTextController2Validator;
  // State field(s) for requirement widget.
  FocusNode? requirementFocusNode;
  TextEditingController? requirementTextController;
  String? Function(BuildContext, String?)? requirementTextControllerValidator;
  String? _requirementTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in FloatingActionButton widget.
  List<OutletLeadsRecord>? countDocCopy;
  // Stores action output result for [Custom Action - blockForSometime] action in FloatingActionButton widget.
  bool? isBlocked;
  // Stores action output result for [Backend Call - Create Document] action in FloatingActionButton widget.
  OutletLeadsRecord? outputCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in FloatingActionButton widget.
  List<LeaveApplicationRecord>? leaveDocs;
  // Stores action output result for [Firestore Query - Query a collection] action in FloatingActionButton widget.
  List<LeadsManagementRecord>? leadDocs;
  // Stores action output result for [Custom Action - getAssingedToIfNotAbsCopy] action in FloatingActionButton widget.
  dynamic? isonLeave;
  // Stores action output result for [Backend Call - Create Document] action in FloatingActionButton widget.
  LeadsManagementRecord? leadMg;

  @override
  void initState(BuildContext context) {
    usernameTextControllerValidator = _usernameTextControllerValidator;
    mobileTextControllerValidator = _mobileTextControllerValidator;
    requirementTextControllerValidator = _requirementTextControllerValidator;
  }

  @override
  void dispose() {
    usernameFocusNode?.dispose();
    usernameTextController?.dispose();

    mobileFocusNode?.dispose();
    mobileTextController?.dispose();

    mobileAltFocusNode?.dispose();
    mobileAltTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    areaFocusNode?.dispose();
    areaTextController?.dispose();

    purchasefromFocusNode?.dispose();
    purchasefromTextController?.dispose();

    phoneFocusNode1?.dispose();
    phoneTextController1?.dispose();

    serialNumberFocusNode?.dispose();
    serialNumberTextController?.dispose();

    phoneFocusNode2?.dispose();
    phoneTextController2?.dispose();

    requirementFocusNode?.dispose();
    requirementTextController?.dispose();
  }
}
