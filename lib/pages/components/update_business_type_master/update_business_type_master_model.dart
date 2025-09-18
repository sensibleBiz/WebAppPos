import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'update_business_type_master_widget.dart'
    show UpdateBusinessTypeMasterWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class UpdateBusinessTypeMasterModel
    extends FlutterFlowModel<UpdateBusinessTypeMasterWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextBusinessTypeName widget.
  FocusNode? textBusinessTypeNameFocusNode;
  TextEditingController? textBusinessTypeNameTextController;
  String? Function(BuildContext, String?)?
      textBusinessTypeNameTextControllerValidator;
  String? _textBusinessTypeNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[A-Za-z]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextBusinessTypeCode widget.
  FocusNode? textBusinessTypeCodeFocusNode;
  TextEditingController? textBusinessTypeCodeTextController;
  String? Function(BuildContext, String?)?
      textBusinessTypeCodeTextControllerValidator;
  // State field(s) for DropDownSubscriptionType widget.
  String? dropDownSubscriptionTypeValue;
  FormFieldController<String>? dropDownSubscriptionTypeValueController;

  @override
  void initState(BuildContext context) {
    textBusinessTypeNameTextControllerValidator =
        _textBusinessTypeNameTextControllerValidator;
  }

  @override
  void dispose() {
    textBusinessTypeNameFocusNode?.dispose();
    textBusinessTypeNameTextController?.dispose();

    textBusinessTypeCodeFocusNode?.dispose();
    textBusinessTypeCodeTextController?.dispose();
  }
}
