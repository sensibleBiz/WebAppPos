import '/backend/backend.dart';
import '/deye_c_r_m/deye_header/deye_header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/cstm_side_nav_bar/cstm_side_nav_bar_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'c_complaint_details_widget.dart' show CComplaintDetailsWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CComplaintDetailsModel extends FlutterFlowModel<CComplaintDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CstmSideNavBar component.
  late CstmSideNavBarModel cstmSideNavBarModel;
  // Model for DeyeHeader component.
  late DeyeHeaderModel deyeHeaderModel;

  @override
  void initState(BuildContext context) {
    cstmSideNavBarModel = createModel(context, () => CstmSideNavBarModel());
    deyeHeaderModel = createModel(context, () => DeyeHeaderModel());
  }

  @override
  void dispose() {
    cstmSideNavBarModel.dispose();
    deyeHeaderModel.dispose();
  }
}
