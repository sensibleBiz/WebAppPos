import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/c_header/c_header_widget.dart';
import '/pages/components/cstm_side_nav_bar/cstm_side_nav_bar_widget.dart';
import '/pages/components/list_view_msg/list_view_msg_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'c_item_wise_sale_report_widget.dart' show CItemWiseSaleReportWidget;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CItemWiseSaleReportModel
    extends FlutterFlowModel<CItemWiseSaleReportWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - productSaleReport] action in cItemWiseSaleReport widget.
  List<dynamic>? result;
  // Model for CstmSideNavBar component.
  late CstmSideNavBarModel cstmSideNavBarModel;
  // Model for cHeader component.
  late CHeaderModel cHeaderModel;

  @override
  void initState(BuildContext context) {
    cstmSideNavBarModel = createModel(context, () => CstmSideNavBarModel());
    cHeaderModel = createModel(context, () => CHeaderModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  @override
  void dispose() {
    cstmSideNavBarModel.dispose();
    cHeaderModel.dispose();
  }
}
