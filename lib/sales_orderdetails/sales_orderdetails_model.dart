import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'sales_orderdetails_widget.dart' show SalesOrderdetailsWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SalesOrderdetailsModel extends FlutterFlowModel<SalesOrderdetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in SalesOrderdetails widget.
  SaleRecord? salDoc;
  // State field(s) for TextFieldPaidAmount widget.
  FocusNode? textFieldPaidAmountFocusNode;
  TextEditingController? textFieldPaidAmountTextController;
  String? Function(BuildContext, String?)?
      textFieldPaidAmountTextControllerValidator;
  // Stores action output result for [Custom Action - balanceAmt] action in TextFieldPaidAmount widget.
  double? balance1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  bool isDataUploading_uploadDataHi2 = false;
  FFUploadedFile uploadedLocalFile_uploadDataHi2 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataHi2 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldPaidAmountFocusNode?.dispose();
    textFieldPaidAmountTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController2?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();

    expandableExpandableController.dispose();
  }
}
