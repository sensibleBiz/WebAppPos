import '/backend/backend.dart';
import '/components/edit_discount_amount_widget.dart';
import '/components/edit_price_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'sale_product_selection_new_copy_widget.dart'
    show SaleProductSelectionNewCopyWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SaleProductSelectionNewCopyModel
    extends FlutterFlowModel<SaleProductSelectionNewCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Custom Action - addToRawlist] action in Container widget.
  List<dynamic>? res1;
  // Stores action output result for [Custom Action - addToRawlist] action in Container widget.
  List<dynamic>? res122;
  // Stores action output result for [Custom Action - reduceQuantity] action in Container widget.
  List<dynamic>? res3;
  // Stores action output result for [Custom Action - addQuantity] action in Container widget.
  List<dynamic>? res4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
