import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'edit_price_widget.dart' show EditPriceWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditPriceModel extends FlutterFlowModel<EditPriceWidget> {
  ///  Local state fields for this component.

  double? text;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldDiscount widget.
  FocusNode? textFieldDiscountFocusNode;
  TextEditingController? textFieldDiscountTextController;
  String? Function(BuildContext, String?)?
      textFieldDiscountTextControllerValidator;
  // Stores action output result for [Custom Action - addToRawlistPrice] action in Container widget.
  List<dynamic>? editPrice;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldDiscountFocusNode?.dispose();
    textFieldDiscountTextController?.dispose();
  }
}
