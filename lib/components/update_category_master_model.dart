import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'update_category_master_widget.dart' show UpdateCategoryMasterWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class UpdateCategoryMasterModel
    extends FlutterFlowModel<UpdateCategoryMasterWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextCategoryMasterTypeName widget.
  FocusNode? textCategoryMasterTypeNameFocusNode;
  TextEditingController? textCategoryMasterTypeNameTextController;
  String? Function(BuildContext, String?)?
      textCategoryMasterTypeNameTextControllerValidator;
  // State field(s) for TextCategoryTypeCode widget.
  FocusNode? textCategoryTypeCodeFocusNode;
  TextEditingController? textCategoryTypeCodeTextController;
  String? Function(BuildContext, String?)?
      textCategoryTypeCodeTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Stores action output result for [Custom Action - dupCategoryMaster] action in Container widget.
  bool? notSame;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textCategoryMasterTypeNameFocusNode?.dispose();
    textCategoryMasterTypeNameTextController?.dispose();

    textCategoryTypeCodeFocusNode?.dispose();
    textCategoryTypeCodeTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();
  }
}
