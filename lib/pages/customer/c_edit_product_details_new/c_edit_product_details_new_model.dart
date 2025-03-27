import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/c_header/c_header_widget.dart';
import '/pages/components/cstm_side_nav_bar/cstm_side_nav_bar_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'c_edit_product_details_new_widget.dart'
    show CEditProductDetailsNewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CEditProductDetailsNewModel
    extends FlutterFlowModel<CEditProductDetailsNewWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CstmSideNavBar component.
  late CstmSideNavBarModel cstmSideNavBarModel;
  // Model for cHeader component.
  late CHeaderModel cHeaderModel;
  // Stores action output result for [Custom Action - productDetails] action in ButtonCategory widget.
  dynamic? prodJson2;
  // Stores action output result for [Firestore Query - Query a collection] action in ButtonCategory widget.
  ProductMasterRecord? productDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in ButtonCategory widget.
  UnitTypeRecord? unitDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in ButtonCategory widget.
  ServicePointOutletRecord? serviceDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in ButtonCategory widget.
  SubCategoryRecord? subDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in ButtonCategory widget.
  TaxMasterRecord? taxDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in ButtonCategory widget.
  CategoryRecord? catDoc;
  // Stores action output result for [Custom Action - checkDupProduct] action in ButtonCategory widget.
  bool? notSame;
  // State field(s) for TextFieldCode widget.
  FocusNode? textFieldCodeFocusNode;
  TextEditingController? textFieldCodeTextController;
  String? Function(BuildContext, String?)? textFieldCodeTextControllerValidator;
  // State field(s) for DropDowProdMasPM2 widget.
  String? dropDowProdMasPM2Value;
  FormFieldController<String>? dropDowProdMasPM2ValueController;
  // State field(s) for TextFieldSellingPrice widget.
  FocusNode? textFieldSellingPriceFocusNode;
  TextEditingController? textFieldSellingPriceTextController;
  String? Function(BuildContext, String?)?
      textFieldSellingPriceTextControllerValidator;
  // State field(s) for TextFieldMrpPrice widget.
  FocusNode? textFieldMrpPriceFocusNode;
  TextEditingController? textFieldMrpPriceTextController;
  String? Function(BuildContext, String?)?
      textFieldMrpPriceTextControllerValidator;
  // State field(s) for TextFieldPurchasePrice widget.
  FocusNode? textFieldPurchasePriceFocusNode;
  TextEditingController? textFieldPurchasePriceTextController;
  String? Function(BuildContext, String?)?
      textFieldPurchasePriceTextControllerValidator;
  // State field(s) for DropDownCate widget.
  String? dropDownCateValue;
  FormFieldController<String>? dropDownCateValueController;
  // State field(s) for DropDownSub widget.
  String? dropDownSubValue;
  FormFieldController<String>? dropDownSubValueController;
  // State field(s) for DropDownUnit widget.
  String? dropDownUnitValue;
  FormFieldController<String>? dropDownUnitValueController;
  // State field(s) for DropDownTax widget.
  String? dropDownTaxValue;
  FormFieldController<String>? dropDownTaxValueController;
  // State field(s) for DropDownService widget.
  String? dropDownServiceValue;
  FormFieldController<String>? dropDownServiceValueController;
  // State field(s) for TextFieldRegionalname widget.
  FocusNode? textFieldRegionalnameFocusNode;
  TextEditingController? textFieldRegionalnameTextController;
  String? Function(BuildContext, String?)?
      textFieldRegionalnameTextControllerValidator;
  // State field(s) for TextFieldReorderLevel widget.
  FocusNode? textFieldReorderLevelFocusNode;
  TextEditingController? textFieldReorderLevelTextController;
  String? Function(BuildContext, String?)?
      textFieldReorderLevelTextControllerValidator;
  // State field(s) for TextFieldShortName widget.
  FocusNode? textFieldShortNameFocusNode;
  TextEditingController? textFieldShortNameTextController;
  String? Function(BuildContext, String?)?
      textFieldShortNameTextControllerValidator;
  // State field(s) for TextFieldHsnCode widget.
  FocusNode? textFieldHsnCodeFocusNode;
  TextEditingController? textFieldHsnCodeTextController;
  String? Function(BuildContext, String?)?
      textFieldHsnCodeTextControllerValidator;
  // Stores action output result for [Custom Action - barcodeRandom] action in IconButton widget.
  String? barcode;
  // State field(s) for TextFieldBarcode widget.
  FocusNode? textFieldBarcodeFocusNode;
  TextEditingController? textFieldBarcodeTextController;
  String? Function(BuildContext, String?)?
      textFieldBarcodeTextControllerValidator;
  var barcode1 = '';
  // State field(s) for TextFieldSearchCode widget.
  FocusNode? textFieldSearchCodeFocusNode;
  TextEditingController? textFieldSearchCodeTextController;
  String? Function(BuildContext, String?)?
      textFieldSearchCodeTextControllerValidator;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue1;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue2;
  // State field(s) for TextFieldDiscountPer widget.
  FocusNode? textFieldDiscountPerFocusNode;
  TextEditingController? textFieldDiscountPerTextController;
  String? Function(BuildContext, String?)?
      textFieldDiscountPerTextControllerValidator;
  // State field(s) for TextFieldDiscountAmt widget.
  FocusNode? textFieldDiscountAmtFocusNode;
  TextEditingController? textFieldDiscountAmtTextController;
  String? Function(BuildContext, String?)?
      textFieldDiscountAmtTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController13;
  String? Function(BuildContext, String?)? textController13Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController14;
  String? Function(BuildContext, String?)? textController14Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController15;
  String? Function(BuildContext, String?)? textController15Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController16;
  String? Function(BuildContext, String?)? textController16Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController17;
  String? Function(BuildContext, String?)? textController17Validator;

  @override
  void initState(BuildContext context) {
    cstmSideNavBarModel = createModel(context, () => CstmSideNavBarModel());
    cHeaderModel = createModel(context, () => CHeaderModel());
  }

  @override
  void dispose() {
    cstmSideNavBarModel.dispose();
    cHeaderModel.dispose();
    textFieldCodeFocusNode?.dispose();
    textFieldCodeTextController?.dispose();

    textFieldSellingPriceFocusNode?.dispose();
    textFieldSellingPriceTextController?.dispose();

    textFieldMrpPriceFocusNode?.dispose();
    textFieldMrpPriceTextController?.dispose();

    textFieldPurchasePriceFocusNode?.dispose();
    textFieldPurchasePriceTextController?.dispose();

    textFieldRegionalnameFocusNode?.dispose();
    textFieldRegionalnameTextController?.dispose();

    textFieldReorderLevelFocusNode?.dispose();
    textFieldReorderLevelTextController?.dispose();

    textFieldShortNameFocusNode?.dispose();
    textFieldShortNameTextController?.dispose();

    textFieldHsnCodeFocusNode?.dispose();
    textFieldHsnCodeTextController?.dispose();

    textFieldBarcodeFocusNode?.dispose();
    textFieldBarcodeTextController?.dispose();

    textFieldSearchCodeFocusNode?.dispose();
    textFieldSearchCodeTextController?.dispose();

    textFieldDiscountPerFocusNode?.dispose();
    textFieldDiscountPerTextController?.dispose();

    textFieldDiscountAmtFocusNode?.dispose();
    textFieldDiscountAmtTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController13?.dispose();

    textFieldFocusNode2?.dispose();
    textController14?.dispose();

    textFieldFocusNode3?.dispose();
    textController15?.dispose();

    textFieldFocusNode4?.dispose();
    textController16?.dispose();

    textFieldFocusNode5?.dispose();
    textController17?.dispose();
  }
}
