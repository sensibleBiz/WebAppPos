import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'add_category_master_widget.dart' show AddCategoryMasterWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddCategoryMasterModel extends FlutterFlowModel<AddCategoryMasterWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextCategoryMasterTypeName widget.
  FocusNode? textCategoryMasterTypeNameFocusNode;
  TextEditingController? textCategoryMasterTypeNameTextController;
  String? Function(BuildContext, String?)?
      textCategoryMasterTypeNameTextControllerValidator;
  // State field(s) for TextCategoryMasterTypeCode widget.
  FocusNode? textCategoryMasterTypeCodeFocusNode;
  TextEditingController? textCategoryMasterTypeCodeTextController;
  String? Function(BuildContext, String?)?
      textCategoryMasterTypeCodeTextControllerValidator;
  bool isDataUploading_uploadDataO95 = false;
  FFUploadedFile uploadedLocalFile_uploadDataO95 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataO95 = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Stores action output result for [Custom Action - updateLangName] action in Button widget.
  List<dynamic>? listRes;
  // Stores action output result for [Custom Action - dupCategoryMaster] action in Container widget.
  bool? dupCategoryMasterRef;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  CategoryMasterRecord? doc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textCategoryMasterTypeNameFocusNode?.dispose();
    textCategoryMasterTypeNameTextController?.dispose();

    textCategoryMasterTypeCodeFocusNode?.dispose();
    textCategoryMasterTypeCodeTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();
  }
}
