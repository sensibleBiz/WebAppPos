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
import 'update_product_master_widget.dart' show UpdateProductMasterWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class UpdateProductMasterModel
    extends FlutterFlowModel<UpdateProductMasterWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextProductName widget.
  FocusNode? textProductNameFocusNode;
  TextEditingController? textProductNameTextController;
  String? Function(BuildContext, String?)?
      textProductNameTextControllerValidator;
  String? _textProductNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[a-zA-Z]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for DropDownCategory widget.
  String? dropDownCategoryValue;
  FormFieldController<String>? dropDownCategoryValueController;
  // State field(s) for DropDownSubCategory widget.
  String? dropDownSubCategoryValue;
  FormFieldController<String>? dropDownSubCategoryValueController;
  // State field(s) for TextProductBarcode widget.
  FocusNode? textProductBarcodeFocusNode;
  TextEditingController? textProductBarcodeTextController;
  String? Function(BuildContext, String?)?
      textProductBarcodeTextControllerValidator;
  String? _textProductBarcodeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[0-9]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextProductHSNCode widget.
  FocusNode? textProductHSNCodeFocusNode;
  TextEditingController? textProductHSNCodeTextController;
  String? Function(BuildContext, String?)?
      textProductHSNCodeTextControllerValidator;
  String? _textProductHSNCodeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[0-9]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextProductMasterCode widget.
  FocusNode? textProductMasterCodeFocusNode;
  TextEditingController? textProductMasterCodeTextController;
  String? Function(BuildContext, String?)?
      textProductMasterCodeTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // Stores action output result for [Custom Action - updateLangName] action in Button widget.
  List<dynamic>? listRes;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  CategoryMasterRecord? catDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  SubCategoryRecord? subDoc;
  // Stores action output result for [Custom Action - dupProductMaster] action in Container widget.
  bool? notSame;

  @override
  void initState(BuildContext context) {
    textProductNameTextControllerValidator =
        _textProductNameTextControllerValidator;
    textProductBarcodeTextControllerValidator =
        _textProductBarcodeTextControllerValidator;
    textProductHSNCodeTextControllerValidator =
        _textProductHSNCodeTextControllerValidator;
  }

  @override
  void dispose() {
    textProductNameFocusNode?.dispose();
    textProductNameTextController?.dispose();

    textProductBarcodeFocusNode?.dispose();
    textProductBarcodeTextController?.dispose();

    textProductHSNCodeFocusNode?.dispose();
    textProductHSNCodeTextController?.dispose();

    textProductMasterCodeFocusNode?.dispose();
    textProductMasterCodeTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController5?.dispose();
  }
}
