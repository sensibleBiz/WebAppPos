import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'add_new_lead_widget.dart' show AddNewLeadWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddNewLeadModel extends FlutterFlowModel<AddNewLeadWidget> {
  ///  Local state fields for this page.

  bool wait = true;

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
  // State field(s) for DropDownBType widget.
  String? dropDownBTypeValue;
  FormFieldController<String>? dropDownBTypeValueController;
  // State field(s) for BName widget.
  FocusNode? bNameFocusNode;
  TextEditingController? bNameTextController;
  String? Function(BuildContext, String?)? bNameTextControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  // State field(s) for DropDownSource widget.
  String? dropDownSourceValue;
  FormFieldController<String>? dropDownSourceValueController;
  // State field(s) for DropDownPriority widget.
  String? dropDownPriorityValue;
  FormFieldController<String>? dropDownPriorityValueController;
  // State field(s) for comments widget.
  FocusNode? commentsFocusNode;
  TextEditingController? commentsTextController;
  String? Function(BuildContext, String?)? commentsTextControllerValidator;
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

  // Stores action output result for [Custom Action - newLeadValidationAction] action in Button widget.
  bool? checkTrue;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<OutletLeadsRecord>? leadRecords;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OutletLeadsRecord? lead;

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

    bNameFocusNode?.dispose();
    bNameTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    commentsFocusNode?.dispose();
    commentsTextController?.dispose();

    requirementFocusNode?.dispose();
    requirementTextController?.dispose();
  }
}
