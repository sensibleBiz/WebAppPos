import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_product_material_sale_widget.dart'
    show EditProductMaterialSaleWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EditProductMaterialSaleModel
    extends FlutterFlowModel<EditProductMaterialSaleWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in EditProductMaterialSale widget.
  ProductRecord? res66;
  // State field(s) for ProductDropDown widget.
  String? productDropDownValue;
  FormFieldController<String>? productDropDownValueController;
  // State field(s) for TextFieldMrpPrice widget.
  FocusNode? textFieldMrpPriceFocusNode;
  TextEditingController? textFieldMrpPriceTextController;
  String? Function(BuildContext, String?)?
      textFieldMrpPriceTextControllerValidator;
  // Stores action output result for [Custom Action - gstAmt] action in TextFieldMrpPrice widget.
  double? gstAmount;
  // Stores action output result for [Custom Action - getTotal] action in TextFieldMrpPrice widget.
  double? res12;
  // State field(s) for TextFieldDeliveryChrg widget.
  FocusNode? textFieldDeliveryChrgFocusNode;
  TextEditingController? textFieldDeliveryChrgTextController;
  String? Function(BuildContext, String?)?
      textFieldDeliveryChrgTextControllerValidator;
  // Stores action output result for [Custom Action - getTotal] action in TextFieldDeliveryChrg widget.
  double? res13;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // Stores action output result for [Custom Action - gstAmt] action in Switch widget.
  double? gstAmountCopy11;
  // Stores action output result for [Custom Action - getTotal] action in Switch widget.
  double? res12Copy11;
  // Stores action output result for [Custom Action - gstAmt] action in Switch widget.
  double? gstAmountCopyCopy1;
  // Stores action output result for [Custom Action - getTotal] action in Switch widget.
  double? res12CopyCopy1;
  // State field(s) for TextFieldStock widget.
  FocusNode? textFieldStockFocusNode;
  TextEditingController? textFieldStockTextController;
  String? Function(BuildContext, String?)?
      textFieldStockTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for DiscountPer widget.
  FocusNode? discountPerFocusNode;
  TextEditingController? discountPerTextController;
  String? Function(BuildContext, String?)? discountPerTextControllerValidator;
  // Stores action output result for [Custom Action - discountAmt] action in DiscountPer widget.
  double? res15;
  // Stores action output result for [Custom Action - getTotal] action in DiscountPer widget.
  double? res16;
  // State field(s) for DropDownGST widget.
  double? dropDownGSTValue;
  FormFieldController<double>? dropDownGSTValueController;
  // Stores action output result for [Custom Action - gstAmt] action in DropDownGST widget.
  double? gstAmount1;
  // Stores action output result for [Custom Action - getTotal] action in DropDownGST widget.
  double? res50;
  // State field(s) for DropDownCategory widget.
  String? dropDownCategoryValue;
  FormFieldController<String>? dropDownCategoryValueController;
  // State field(s) for DropDownUnitType widget.
  String? dropDownUnitTypeValue;
  FormFieldController<String>? dropDownUnitTypeValueController;
  // State field(s) for Switch widget.
  bool? switchValue2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldMrpPriceFocusNode?.dispose();
    textFieldMrpPriceTextController?.dispose();

    textFieldDeliveryChrgFocusNode?.dispose();
    textFieldDeliveryChrgTextController?.dispose();

    textFieldStockFocusNode?.dispose();
    textFieldStockTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController4?.dispose();

    discountPerFocusNode?.dispose();
    discountPerTextController?.dispose();
  }
}
