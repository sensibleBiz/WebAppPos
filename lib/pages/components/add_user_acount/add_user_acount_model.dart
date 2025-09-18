import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/map_team_copy/map_team_copy_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'add_user_acount_widget.dart' show AddUserAcountWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddUserAcountModel extends FlutterFlowModel<AddUserAcountWidget> {
  ///  Local state fields for this component.

  String? cityList;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldName widget.
  FocusNode? textFieldNameFocusNode1;
  TextEditingController? textFieldNameTextController1;
  String? Function(BuildContext, String?)?
      textFieldNameTextController1Validator;
  String? _textFieldNameTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[a-zA-Z]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextFieldMobile widget.
  FocusNode? textFieldMobileFocusNode;
  TextEditingController? textFieldMobileTextController;
  String? Function(BuildContext, String?)?
      textFieldMobileTextControllerValidator;
  String? _textFieldMobileTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[0-9]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextFieldEmailId widget.
  FocusNode? textFieldEmailIdFocusNode;
  TextEditingController? textFieldEmailIdTextController;
  String? Function(BuildContext, String?)?
      textFieldEmailIdTextControllerValidator;
  String? _textFieldEmailIdTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextFieldPassword widget.
  FocusNode? textFieldPasswordFocusNode;
  TextEditingController? textFieldPasswordTextController;
  late bool textFieldPasswordVisibility;
  String? Function(BuildContext, String?)?
      textFieldPasswordTextControllerValidator;
  // State field(s) for DropDownState widget.
  String? dropDownStateValue;
  FormFieldController<String>? dropDownStateValueController;
  // State field(s) for DropDownCity widget.
  String? dropDownCityValue;
  FormFieldController<String>? dropDownCityValueController;
  // State field(s) for TextFieldName widget.
  FocusNode? textFieldNameFocusNode2;
  TextEditingController? textFieldNameTextController2;
  String? Function(BuildContext, String?)?
      textFieldNameTextController2Validator;
  // State field(s) for TextFieldQuickPin widget.
  FocusNode? textFieldQuickPinFocusNode;
  TextEditingController? textFieldQuickPinTextController;
  String? Function(BuildContext, String?)?
      textFieldQuickPinTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  UserProfileRecord? userprofile;

  @override
  void initState(BuildContext context) {
    textFieldNameTextController1Validator =
        _textFieldNameTextController1Validator;
    textFieldMobileTextControllerValidator =
        _textFieldMobileTextControllerValidator;
    textFieldEmailIdTextControllerValidator =
        _textFieldEmailIdTextControllerValidator;
    textFieldPasswordVisibility = false;
  }

  @override
  void dispose() {
    textFieldNameFocusNode1?.dispose();
    textFieldNameTextController1?.dispose();

    textFieldMobileFocusNode?.dispose();
    textFieldMobileTextController?.dispose();

    textFieldEmailIdFocusNode?.dispose();
    textFieldEmailIdTextController?.dispose();

    textFieldPasswordFocusNode?.dispose();
    textFieldPasswordTextController?.dispose();

    textFieldNameFocusNode2?.dispose();
    textFieldNameTextController2?.dispose();

    textFieldQuickPinFocusNode?.dispose();
    textFieldQuickPinTextController?.dispose();
  }
}
