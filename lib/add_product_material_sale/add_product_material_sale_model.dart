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
import '/index.dart';
import 'add_product_material_sale_widget.dart'
    show AddProductMaterialSaleWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddProductMaterialSaleModel
    extends FlutterFlowModel<AddProductMaterialSaleWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ProductDropDown widget.
  String? productDropDownValue;
  FormFieldController<String>? productDropDownValueController;
  // State field(s) for TextFieldMrpPrice widget.
  FocusNode? textFieldMrpPriceFocusNode;
  TextEditingController? textFieldMrpPriceTextController;
  String? Function(BuildContext, String?)?
      textFieldMrpPriceTextControllerValidator;
  // Stores action output result for [Custom Action - discountAmt] action in TextFieldMrpPrice widget.
  double? res11;
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
  // Stores action output result for [Custom Action - discountAmt] action in Switch widget.
  double? res110;
  // Stores action output result for [Custom Action - gstAmt] action in Switch widget.
  double? gstAmount0;
  // Stores action output result for [Custom Action - getTotal] action in Switch widget.
  double? res120;
  // Stores action output result for [Custom Action - discountAmt] action in Switch widget.
  double? res111;
  // Stores action output result for [Custom Action - gstAmt] action in Switch widget.
  double? gstAmount11;
  // Stores action output result for [Custom Action - getTotal] action in Switch widget.
  double? res121;
  // State field(s) for TextFieldStock widget.
  FocusNode? textFieldStockFocusNode;
  TextEditingController? textFieldStockTextController;
  String? Function(BuildContext, String?)?
      textFieldStockTextControllerValidator;
  // State field(s) for TextFielLeadTime widget.
  FocusNode? textFielLeadTimeFocusNode;
  TextEditingController? textFielLeadTimeTextController;
  String? Function(BuildContext, String?)?
      textFielLeadTimeTextControllerValidator;
  // State field(s) for TextFieldDiscountPer widget.
  FocusNode? textFieldDiscountPerFocusNode;
  TextEditingController? textFieldDiscountPerTextController;
  String? Function(BuildContext, String?)?
      textFieldDiscountPerTextControllerValidator;
  // Stores action output result for [Custom Action - discountAmt] action in TextFieldDiscountPer widget.
  double? res15;
  // Stores action output result for [Custom Action - getTotal] action in TextFieldDiscountPer widget.
  double? res16;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - gstAmt] action in DropDown widget.
  double? gstAmount1;
  // Stores action output result for [Custom Action - getTotal] action in DropDown widget.
  double? res20;
  // State field(s) for DropDownCategory widget.
  String? dropDownCategoryValue;
  FormFieldController<String>? dropDownCategoryValueController;
  // State field(s) for DropDownUnitType widget.
  String? dropDownUnitTypeValue;
  FormFieldController<String>? dropDownUnitTypeValueController;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProductRecord? proDoc1;

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

    textFielLeadTimeFocusNode?.dispose();
    textFielLeadTimeTextController?.dispose();

    textFieldDiscountPerFocusNode?.dispose();
    textFieldDiscountPerTextController?.dispose();
  }
}
