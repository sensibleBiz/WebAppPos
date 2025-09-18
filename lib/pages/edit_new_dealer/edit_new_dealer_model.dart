import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'edit_new_dealer_widget.dart' show EditNewDealerWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EditNewDealerModel extends FlutterFlowModel<EditNewDealerWidget> {
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
  // State field(s) for partnerName widget.
  FocusNode? partnerNameFocusNode;
  TextEditingController? partnerNameTextController;
  String? Function(BuildContext, String?)? partnerNameTextControllerValidator;
  // State field(s) for partnerMobile widget.
  FocusNode? partnerMobileFocusNode;
  TextEditingController? partnerMobileTextController;
  String? Function(BuildContext, String?)? partnerMobileTextControllerValidator;
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
  // State field(s) for firmName widget.
  FocusNode? firmNameFocusNode;
  TextEditingController? firmNameTextController;
  String? Function(BuildContext, String?)? firmNameTextControllerValidator;
  // State field(s) for gstNo widget.
  FocusNode? gstNoFocusNode;
  TextEditingController? gstNoTextController;
  String? Function(BuildContext, String?)? gstNoTextControllerValidator;
  // State field(s) for dealCode widget.
  FocusNode? dealCodeFocusNode;
  TextEditingController? dealCodeTextController;
  String? Function(BuildContext, String?)? dealCodeTextControllerValidator;
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
  // State field(s) for dealsIn widget.
  FocusNode? dealsInFocusNode;
  TextEditingController? dealsInTextController;
  String? Function(BuildContext, String?)? dealsInTextControllerValidator;
  String? _dealsInTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;

  @override
  void initState(BuildContext context) {
    usernameTextControllerValidator = _usernameTextControllerValidator;
    mobileTextControllerValidator = _mobileTextControllerValidator;
    dealsInTextControllerValidator = _dealsInTextControllerValidator;
  }

  @override
  void dispose() {
    usernameFocusNode?.dispose();
    usernameTextController?.dispose();

    mobileFocusNode?.dispose();
    mobileTextController?.dispose();

    mobileAltFocusNode?.dispose();
    mobileAltTextController?.dispose();

    partnerNameFocusNode?.dispose();
    partnerNameTextController?.dispose();

    partnerMobileFocusNode?.dispose();
    partnerMobileTextController?.dispose();

    areaFocusNode?.dispose();
    areaTextController?.dispose();

    firmNameFocusNode?.dispose();
    firmNameTextController?.dispose();

    gstNoFocusNode?.dispose();
    gstNoTextController?.dispose();

    dealCodeFocusNode?.dispose();
    dealCodeTextController?.dispose();

    commentsFocusNode?.dispose();
    commentsTextController?.dispose();

    dealsInFocusNode?.dispose();
    dealsInTextController?.dispose();
  }
}
