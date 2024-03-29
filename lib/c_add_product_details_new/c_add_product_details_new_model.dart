import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/c_header_widget.dart';
import '/components/cstm_side_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'c_add_product_details_new_widget.dart' show CAddProductDetailsNewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CAddProductDetailsNewModel
    extends FlutterFlowModel<CAddProductDetailsNewWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for CstmSideNavBar component.
  late CstmSideNavBarModel cstmSideNavBarModel;
  // Model for cHeader component.
  late CHeaderModel cHeaderModel;
  // Stores action output result for [Custom Action - checkDupProduct] action in Container widget.
  bool? notSame;
  // Stores action output result for [Custom Action - productDetails] action in Container widget.
  dynamic? jsonData;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ProductMasterRecord? productDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  SubCategoryRecord? subDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  TaxMasterRecord? taxDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  UnitTypeRecord? unitDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ServicePointOutletRecord? serviceDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  CategoryRecord? catDoc;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ProductRecord? proDoc;
  // State field(s) for code widget.
  FocusNode? codeFocusNode;
  TextEditingController? codeController;
  String? Function(BuildContext, String?)? codeControllerValidator;
  // State field(s) for ProductDropDown widget.
  String? productDropDownValue;
  FormFieldController<String>? productDropDownValueController;
  // State field(s) for TextFieldSellingPrice widget.
  FocusNode? textFieldSellingPriceFocusNode;
  TextEditingController? textFieldSellingPriceController;
  String? Function(BuildContext, String?)?
      textFieldSellingPriceControllerValidator;
  // State field(s) for TextFieldMrpPrice widget.
  FocusNode? textFieldMrpPriceFocusNode;
  TextEditingController? textFieldMrpPriceController;
  String? Function(BuildContext, String?)? textFieldMrpPriceControllerValidator;
  // State field(s) for TextFieldPurchasePrice widget.
  FocusNode? textFieldPurchasePriceFocusNode;
  TextEditingController? textFieldPurchasePriceController;
  String? Function(BuildContext, String?)?
      textFieldPurchasePriceControllerValidator;
  // State field(s) for CatDropDown widget.
  String? catDropDownValue;
  FormFieldController<String>? catDropDownValueController;
  // State field(s) for SubCatDropDown widget.
  String? subCatDropDownValue;
  FormFieldController<String>? subCatDropDownValueController;
  // State field(s) for UnitDropDown widget.
  String? unitDropDownValue;
  FormFieldController<String>? unitDropDownValueController;
  // State field(s) for TaxDropDown widget.
  String? taxDropDownValue;
  FormFieldController<String>? taxDropDownValueController;
  // State field(s) for ServiceDropDown widget.
  String? serviceDropDownValue;
  FormFieldController<String>? serviceDropDownValueController;
  // State field(s) for TextFieldRegionalName widget.
  FocusNode? textFieldRegionalNameFocusNode;
  TextEditingController? textFieldRegionalNameController;
  String? Function(BuildContext, String?)?
      textFieldRegionalNameControllerValidator;
  // State field(s) for TextFieldReorderLevel widget.
  FocusNode? textFieldReorderLevelFocusNode;
  TextEditingController? textFieldReorderLevelController;
  String? Function(BuildContext, String?)?
      textFieldReorderLevelControllerValidator;
  // State field(s) for TextFieldShortName widget.
  FocusNode? textFieldShortNameFocusNode;
  TextEditingController? textFieldShortNameController;
  String? Function(BuildContext, String?)?
      textFieldShortNameControllerValidator;
  // State field(s) for TextFieldHsnCode widget.
  FocusNode? textFieldHsnCodeFocusNode;
  TextEditingController? textFieldHsnCodeController;
  String? Function(BuildContext, String?)? textFieldHsnCodeControllerValidator;
  // Stores action output result for [Custom Action - barcodeRandom] action in IconButton widget.
  String? barcode;
  var barcode1 = '';
  // State field(s) for TextFieldSearchCode widget.
  FocusNode? textFieldSearchCodeFocusNode;
  TextEditingController? textFieldSearchCodeController;
  String? Function(BuildContext, String?)?
      textFieldSearchCodeControllerValidator;
  // State field(s) for Weightable widget.
  bool? weightableValue;
  // State field(s) for Stockable widget.
  bool? stockableValue;
  // State field(s) for TextFieldDiscountPer widget.
  FocusNode? textFieldDiscountPerFocusNode;
  TextEditingController? textFieldDiscountPerController;
  String? Function(BuildContext, String?)?
      textFieldDiscountPerControllerValidator;
  // State field(s) for TextFieldDiscountAmt widget.
  FocusNode? textFieldDiscountAmtFocusNode;
  TextEditingController? textFieldDiscountAmtController;
  String? Function(BuildContext, String?)?
      textFieldDiscountAmtControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController12;
  String? Function(BuildContext, String?)? textController12Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController13;
  String? Function(BuildContext, String?)? textController13Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController14;
  String? Function(BuildContext, String?)? textController14Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController15;
  String? Function(BuildContext, String?)? textController15Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController16;
  String? Function(BuildContext, String?)? textController16Validator;

  @override
  void initState(BuildContext context) {
    cstmSideNavBarModel = createModel(context, () => CstmSideNavBarModel());
    cHeaderModel = createModel(context, () => CHeaderModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cstmSideNavBarModel.dispose();
    cHeaderModel.dispose();
    codeFocusNode?.dispose();
    codeController?.dispose();

    textFieldSellingPriceFocusNode?.dispose();
    textFieldSellingPriceController?.dispose();

    textFieldMrpPriceFocusNode?.dispose();
    textFieldMrpPriceController?.dispose();

    textFieldPurchasePriceFocusNode?.dispose();
    textFieldPurchasePriceController?.dispose();

    textFieldRegionalNameFocusNode?.dispose();
    textFieldRegionalNameController?.dispose();

    textFieldReorderLevelFocusNode?.dispose();
    textFieldReorderLevelController?.dispose();

    textFieldShortNameFocusNode?.dispose();
    textFieldShortNameController?.dispose();

    textFieldHsnCodeFocusNode?.dispose();
    textFieldHsnCodeController?.dispose();

    textFieldSearchCodeFocusNode?.dispose();
    textFieldSearchCodeController?.dispose();

    textFieldDiscountPerFocusNode?.dispose();
    textFieldDiscountPerController?.dispose();

    textFieldDiscountAmtFocusNode?.dispose();
    textFieldDiscountAmtController?.dispose();

    textFieldFocusNode1?.dispose();
    textController12?.dispose();

    textFieldFocusNode2?.dispose();
    textController13?.dispose();

    textFieldFocusNode3?.dispose();
    textController14?.dispose();

    textFieldFocusNode4?.dispose();
    textController15?.dispose();

    textFieldFocusNode5?.dispose();
    textController16?.dispose();
  }
}
