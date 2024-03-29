import '/backend/backend.dart';
import '/components/c_header_widget.dart';
import '/components/cstm_side_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'cust_leads_widget.dart' show CustLeadsWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustLeadsModel extends FlutterFlowModel<CustLeadsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for CstmSideNavBar component.
  late CstmSideNavBarModel cstmSideNavBarModel;
  // Model for cHeader component.
  late CHeaderModel cHeaderModel;
  // Stores action output result for [Custom Action - generateLeadCustomerCode] action in Button widget.
  int? len;

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
  }
}
