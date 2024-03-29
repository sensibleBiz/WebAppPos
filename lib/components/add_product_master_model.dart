import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_product_master_widget.dart' show AddProductMasterWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddProductMasterModel extends FlutterFlowModel<AddProductMasterWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in AddProductMaster widget.
  CategoryMasterRecord? catRef;
  // State field(s) for TextProductName widget.
  FocusNode? textProductNameFocusNode;
  TextEditingController? textProductNameController;
  String? Function(BuildContext, String?)? textProductNameControllerValidator;
  String? _textProductNameControllerValidator(
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
  TextEditingController? textProductBarcodeController;
  String? Function(BuildContext, String?)?
      textProductBarcodeControllerValidator;
  String? _textProductBarcodeControllerValidator(
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
  TextEditingController? textProductHSNCodeController;
  String? Function(BuildContext, String?)?
      textProductHSNCodeControllerValidator;
  String? _textProductHSNCodeControllerValidator(
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
  TextEditingController? textProductMasterCodeController;
  String? Function(BuildContext, String?)?
      textProductMasterCodeControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // Stores action output result for [Custom Action - updateLangName] action in Button widget.
  List<dynamic>? listRes;
  // Stores action output result for [Firestore Query - Query a collection] action in ContainerSubCategory2 widget.
  CategoryMasterRecord? catDocRef;
  // Stores action output result for [Firestore Query - Query a collection] action in ContainerSubCategory2 widget.
  SubCategoryRecord? subCatRef;
  // Stores action output result for [Custom Action - dupProductMaster] action in ContainerSubCategory2 widget.
  bool? dupProductMasterRef;
  // Stores action output result for [Backend Call - Create Document] action in ContainerSubCategory2 widget.
  ProductMasterRecord? doc;

  @override
  void initState(BuildContext context) {
    textProductNameControllerValidator = _textProductNameControllerValidator;
    textProductBarcodeControllerValidator =
        _textProductBarcodeControllerValidator;
    textProductHSNCodeControllerValidator =
        _textProductHSNCodeControllerValidator;
  }

  @override
  void dispose() {
    textProductNameFocusNode?.dispose();
    textProductNameController?.dispose();

    textProductBarcodeFocusNode?.dispose();
    textProductBarcodeController?.dispose();

    textProductHSNCodeFocusNode?.dispose();
    textProductHSNCodeController?.dispose();

    textProductMasterCodeFocusNode?.dispose();
    textProductMasterCodeController?.dispose();

    textFieldFocusNode?.dispose();
    textController5?.dispose();
  }
}
