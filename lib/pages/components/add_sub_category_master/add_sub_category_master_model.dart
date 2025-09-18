import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'add_sub_category_master_widget.dart' show AddSubCategoryMasterWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddSubCategoryMasterModel
    extends FlutterFlowModel<AddSubCategoryMasterWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextSubCategoryMasterTypeName widget.
  FocusNode? textSubCategoryMasterTypeNameFocusNode;
  TextEditingController? textSubCategoryMasterTypeNameTextController;
  String? Function(BuildContext, String?)?
      textSubCategoryMasterTypeNameTextControllerValidator;
  String? _textSubCategoryMasterTypeNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[a-zA-Z]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for DropDownCategoryName widget.
  String? dropDownCategoryNameValue;
  FormFieldController<String>? dropDownCategoryNameValueController;
  // State field(s) for TextCategoryMasterTypeCode widget.
  FocusNode? textCategoryMasterTypeCodeFocusNode;
  TextEditingController? textCategoryMasterTypeCodeTextController;
  String? Function(BuildContext, String?)?
      textCategoryMasterTypeCodeTextControllerValidator;
  // Stores action output result for [Custom Action - dupSubCategory] action in Container widget.
  bool? notSame;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  SubCategoryRecord? doc;

  @override
  void initState(BuildContext context) {
    textSubCategoryMasterTypeNameTextControllerValidator =
        _textSubCategoryMasterTypeNameTextControllerValidator;
  }

  @override
  void dispose() {
    textSubCategoryMasterTypeNameFocusNode?.dispose();
    textSubCategoryMasterTypeNameTextController?.dispose();

    textCategoryMasterTypeCodeFocusNode?.dispose();
    textCategoryMasterTypeCodeTextController?.dispose();
  }
}
